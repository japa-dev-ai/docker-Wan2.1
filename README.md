# Docker-Wan2.1
**Título:** Instalando e Configurando Wan2.1 no Docker – Modelos de Fundação para Vídeo  

**Descrição:**  
Neste repositório, vamos configurar e montar uma imagem Docker com o **Wan2.1**, um conjunto aberto e poderoso de modelos de fundação para vídeo. Você aprenderá como instalar, configurar e utilizar esses modelos para processamento e geração de vídeos com inteligência artificial.  

🔹 **O que você vai ver nesta branch?**  
✅ Como configurar o Docker para rodar o Wan2.1  
✅ Instalação e configuração do ambiente  
✅ Explicação sobre os modelos de fundação de vídeo  
✅ Testes e demonstrações práticas  

## Quickstart

#### Instalação
Clonar o repositório:
```sh
git clone https://github.com/japa-dev-ai/docker-Wan2.1.git
cd docker-Wan2.1
```

Executar no Docker:
```sh
# CMD no Terminal
docker-compose  up --build  -d
```

#### Download dos Modelos

| Models        |                       Download Link                                           |    Notes                      |
| --------------|-------------------------------------------------------------------------------|-------------------------------|
| T2V-14B       |      🤗 [Huggingface](https://huggingface.co/Wan-AI/Wan2.1-T2V-14B)      🤖 [ModelScope](https://www.modelscope.cn/models/Wan-AI/Wan2.1-T2V-14B)          | Supports both 480P and 720P
| I2V-14B-720P  |      🤗 [Huggingface](https://huggingface.co/Wan-AI/Wan2.1-I2V-14B-720P)    🤖 [ModelScope](https://www.modelscope.cn/models/Wan-AI/Wan2.1-I2V-14B-720P)     | Supports 720P
| I2V-14B-480P  |      🤗 [Huggingface](https://huggingface.co/Wan-AI/Wan2.1-I2V-14B-480P)    🤖 [ModelScope](https://www.modelscope.cn/models/Wan-AI/Wan2.1-I2V-14B-480P)      | Supports 480P
| T2V-1.3B      |      🤗 [Huggingface](https://huggingface.co/Wan-AI/Wan2.1-T2V-1.3B)     🤖 [ModelScope](https://www.modelscope.cn/models/Wan-AI/Wan2.1-T2V-1.3B)         | Supports 480P


💡 Se você se interessa por **inteligência artificial, aprendizado de máquina e processamento de vídeo**, esse local é para você!  

🔹 **Links**  
✅  [Wan-Video](https://github.com/Wan-Video/Wan2.1)


#Docker #Wan2.1 #InteligênciaArtificial #MachineLearning #VídeoAI