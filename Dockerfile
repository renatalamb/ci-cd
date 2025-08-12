# --- Etapa 1: A Construção (Build Stage) ---
# Usa a imagem oficial do Maven com o Java 21 para compilar o projeto.
FROM maven:3.9.5-amazoncorretto-21-al2023 AS build
# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app
# Copia o arquivo de configuração do Maven para o contêiner.
COPY pom.xml .
# Copia os arquivos de código-fonte do projeto.
COPY src ./src
# Executa a compilação, o teste e a criação do arquivo .jar.
RUN mvn clean package -DskipTests

# --- Etapa 2: A Imagem Final (Final Image Stage) ---
# Usa uma imagem oficial do Java 21, mais leve, apenas com o ambiente de execução (JRE).
FROM amazoncorretto:21-alpine
# Define o diretório de trabalho.
WORKDIR /app
# Copia o arquivo .jar gerado na etapa de construção para a imagem final.
COPY --from=build /app/target/*.jar app.jar
# O EXPOSE informa que a aplicação dentro do contêiner usará a porta 8080.
EXPOSE 8080
# O ENTRYPOINT define o comando que será executado quando o contêiner for iniciado.
ENTRYPOINT ["java", "-jar", "app.jar"]