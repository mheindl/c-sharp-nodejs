FROM microsoft/dotnet:latest

RUN apt-get update -y
RUN apt-get install -y curl git
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs
RUN npm install -g npm
RUN npm install -g node-gyp

WORKDIR /app

# ENTRYPOINT [ "dotnet" ]
