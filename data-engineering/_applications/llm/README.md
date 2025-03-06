# LLM
* [Large language model - wikipedia](https://en.wikipedia.org/wiki/Large_language_model)
* [Awesome-LLM - GitHub](https://github.com/Hannibal046/Awesome-LLM)
* [awesome-LLM-resourses - GitHub](https://github.com/WangRongsheng/awesome-LLM-resourses)

# Tools

## Ollama

* [Ollama](https://github.com/ollama/ollama): Get up and running with Llama 3.3, DeepSeek-R1, Phi-4, Gemma 2, and other large language models.
	* [Doc](https://github.com/ollama/ollama/tree/main/docs): [faq](https://github.com/ollama/ollama/blob/main/docs/faq.md)
	* [library](https://ollama.com/library)

```shell
# environment variable for user
$ echo %OLLAMA_MODELS%
D:\llm
```

Run a model:

```shell
$ ollama run deepseek-r1:1.5b
pulling manifest
pulling aabd4debf0c8... 100% ▕████████████████████████████████████████████████████████████████████████████████████▏ 1.1 GB
pulling 369ca498f347... 100% ▕████████████████████████████████████████████████████████████████████████████████████▏  387 B
pulling 6e4c38e1172f... 100% ▕████████████████████████████████████████████████████████████████████████████████████▏ 1.1 KB
pulling f4d24e9138dd... 100% ▕████████████████████████████████████████████████████████████████████████████████████▏  148 B
pulling a85fe2a2e58e... 100% ▕████████████████████████████████████████████████████████████████████████████████████▏  487 B
verifying sha256 digest
writing manifest
success
>>>
>>> 你是?
<think>

</think>

您好！我是由中国的深度求索（DeepSeek）公司开发的智能助手DeepSeek-R1。如您有任何任何问题，我会尽我所能为您提供帮助。

>>> Send a message (/? for help)
```

## Open WebUI

* [Open WebUI](https://github.com/open-webui/open-webui): Open WebUI is an extensible, feature-rich, and user-friendly self-hosted AI platform designed to operate entirely offline. It supports various LLM runners like Ollama and OpenAI-compatible APIs, with built-in inference engine for RAG, making it a powerful AI deployment solution.

```shell
# Ollima on same computer
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
# Admin account: jargonzhou/jargonzhou
```
