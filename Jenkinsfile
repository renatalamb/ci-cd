pipeline {
  // O agente 'any' significa que a pipeline pode rodar em qualquer nó Jenkins disponível.
  agent any

  stages {
    stage('Checkout') {
      steps {
        // Busca o código do seu repositório no GitHub.
        git branch: 'main',
            url: 'https://github.com/renatalamb/ci-cd'
      }
    }

    stage('Build & Test') {
      steps {
        echo 'Construindo e testando o aplicativo Spring Boot...'
        // O comando 'mvn clean package' compila o projeto, executa os testes e gera o arquivo .jar.
        sh 'mvn clean package'
      }
    }

    stage('Build Docker Image') {
      steps {
        echo 'Criando a imagem Docker da sua aplicação...'
        // O comando 'docker build' cria uma imagem a partir do Dockerfile.
        // O '. -t minha-app' marca a imagem com a tag 'minha-app'.
        sh 'docker build -t minha-app .'
      }
    }

    stage('Deploy') {
      steps {
        echo 'Implantando o aplicativo no contêiner...'
        // Para implantar, paramos qualquer contêiner antigo e iniciamos um novo.
        // O comando 'docker run' executa a imagem.
        // -d: roda em modo detached (segundo plano)
        // -p: mapeia a porta da máquina (8081) para a porta do contêiner (8080).
        // Isso resolve o conflito de porta com o Jenkins.
        sh 'docker stop minha-app || true'
        sh 'docker rm minha-app || true'
        sh 'docker run -d --name minha-app -p 8081:8080 minha-app'
      }
    }
  }

  post {
    success {
      echo 'Pipeline concluído com sucesso!'
    }
    failure {
      echo 'Falha no pipeline. Verifique os logs.'
    }
  }
}