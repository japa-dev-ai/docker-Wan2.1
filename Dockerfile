# Dockerfile
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential python3.11 python3-pip python3-dev python3-venv \
    libgl1 libglib2.0-0 ffmpeg sox tzdata openssh-server git nano sudo \
    google-perftools libtcmalloc-minimal4 && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Cria o usuário
RUN useradd -m sduser && echo "sduser:1234" | chpasswd 

# Configura o SSH
RUN mkdir /var/run/sshd
RUN echo "PermitRootLogin no" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "AllowUsers sduser" >> /etc/ssh/sshd_config

RUN export LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4"

RUN git clone https://github.com/Wan-Video/Wan2.1.git /app
WORKDIR /app

RUN PIP_ROOT_USER_ACTION=ignore
RUN su sduser
# Ensure torch >= 2.4.0
#RUN cat requirements.txt | sed -e '/^\s*#.*$/d' -e '/^\s*$/d' | xargs -n 1 pip install
RUN pip install -r requirements.txt --root-user-action=ignore
RUN pip install "huggingface_hub"
RUN huggingface-cli download Wan-AI/Wan2.1-T2V-14B --local-dir ./Wan2.1-T2V-14B
RUN exit

WORKDIR /app
# if one uses dashscope’s API for prompt extension
RUN DASH_API_KEY=your_key python t2v_14B_singleGPU.py --prompt_extend_method 'dashscope' --ckpt_dir ./Wan2.1-T2V-14B

# if one uses a local model for prompt extension
# RUN python3 ./gradio/t2v_14B_singleGPU.py --prompt_extend_method 'local_qwen' --ckpt_dir ./Wan2.1-T2V-14B


EXPOSE 22 
CMD service ssh start && python3 ./gradio/t2v_14B_singleGPU.py --prompt_extend_method 'local_qwen' --ckpt_dir ./Wan2.1-T2V-14B && tail -f /dev/null
