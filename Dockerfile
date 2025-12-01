FROM jenkins/jenkins:lts

USER root

# Pega o GID do docker do host e replica no container
RUN groupadd -for -g 102 docker \
    && usermod -aG docker jenkins

RUN apt-get update && apt-get install -y docker.io && apt-get clean

USER jenkins
