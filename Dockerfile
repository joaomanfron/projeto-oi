# Utiliza a versão mais estável do node e nomeia como angular
FROM node:alpine as angular 

# Seta a pasta raiz como app
WORKDIR /app

# Copia o package.json e cola na pasta app
COPY package.json /app

# Instala as dependências
RUN npm install --silent

# Copia todos os arquivos e cola na pasta raiz
COPY . .

# Roda o script de produção do angular para gerar a pasta dist (arquivos minificados)
RUN npm run build


# Utiliza a versão mais estável do nginx
FROM nginx:alpine

# Copia os arquivos necessários para fazer uso do nginx
VOLUME /var/cache/nginx

# Copia os arquivos da pasta dist e cola na pasta do nginx
COPY --from=angular app/dist/site-oi /usr/share/nginx/html

# Copia o arquivo de configuração do nginx e substitui o arquivo padrão
COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf