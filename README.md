# ci-cd-springboot

<br>

Este repositório contém um projeto simples de uma aplicação **Spring Boot**, que serve como um exemplo prático para demonstrar um pipeline de **Integração Contínua e Entrega Contínua (CI/CD)** usando **Jenkins** e **Docker**.

A pipeline completa foi configurada para automatizar o processo de construção, teste e implantação da aplicação em um contêiner Docker.

---

## 🚀 Tecnologias Utilizadas

* **Java 21**: Linguagem de programação principal.
* **Spring Boot**: Framework para a criação de aplicações Java.
* **Maven**: Ferramenta de gerenciamento de dependências e construção do projeto.
* **Docker**: Plataforma de virtualização de contêineres para empacotar e executar a aplicação.
* **Jenkins**: Servidor de automação para orquestrar o pipeline de CI/CD.

---

## 🛠️ Pré-requisitos

Para executar este projeto e a pipeline de CI/CD localmente, você precisa ter as seguintes ferramentas instaladas no seu ambiente (neste caso, o **WSL Ubuntu**):

* **Java JDK 21**
* **Maven**
* **Docker**
* **Jenkins**

> **Nota:** Certifique-se de que o Jenkins tem permissão para usar o Docker, adicionando o usuário `jenkins` ao grupo `docker`: `sudo usermod -aG docker jenkins` e reiniciando o serviço do Jenkins.

---

## 📦 Estrutura do Projeto

* `src/`: Código-fonte da aplicação Spring Boot.
* `pom.xml`: Arquivo de configuração do Maven.
* `Dockerfile`: Define a imagem Docker para a aplicação.
* `Jenkinsfile`: Define o pipeline de CI/CD executado pelo Jenkins.

---

## 🚀 Como Executar o Projeto com o Pipeline de CI/CD

Para executar a pipeline de CI/CD e implantar a aplicação automaticamente com o Jenkins, siga os seguintes passos:

### 1. Clonar o Repositório

Primeiro, clone o projeto para sua máquina local (ou para o ambiente onde o Jenkins está instalado):

```bash
git clone [https://github.com/renatalamb/ci-cd.git](https://github.com/renatalamb/ci-cd.git)
```
---

### 2. Configurar o Job no Jenkins

1.  Acesse o Jenkins pelo seu navegador na porta configurada (ex: `http://localhost:8081`).
2.  Na página principal do Jenkins, clique em **"New Item"** e dê um nome para o job, por exemplo, `minha-aplicacao-ci-cd`.
3.  Selecione a opção **"Pipeline"** e clique em **"OK"**.
4.  Na seção de configuração, role para baixo até **"Pipeline"**.
5.  Em **"Definition"**, selecione **"Pipeline script from SCM"**.
6.  Em **"SCM"**, selecione **"Git"**.
7.  No campo **"Repository URL"**, cole a URL do seu repositório: `https://github.com/renatalamb/ci-cd.git`.
8.  Mantenha o **"Script Path"** como `Jenkinsfile`, que é o nome do arquivo da pipeline no seu repositório.
9.  Clique em **"Save"**.

### 3. Executar a Pipeline

Com o job configurado, você pode iniciar a pipeline:

1.  Na página do job, clique em **"Build Now"** no menu lateral.

O Jenkins irá executar todas as etapas da pipeline (`Checkout`, `Build`, `Build Docker Image` e `Deploy`) automaticamente. Se a execução for bem-sucedida, sua aplicação estará rodando em um contêiner Docker, acessível em `http://localhost:8082`.
