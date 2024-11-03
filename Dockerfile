# Use a imagem base do R com Quarto
FROM rocker/verse:latest

# Defina o frontend do Debian como não interativo
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar o sistema e instalar pacotes básicos
RUN apt-get update && \
    apt-get install -y wget curl gdebi-core && \
    rm -rf /var/lib/apt/lists/*

# Instalar dependências principais, excluindo os pacotes problemáticos
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libpangocairo-1.0-0 \
    libnss3 \
    libxshmfence1 \
    libgtk-3-0 \
    fonts-texgyre && \
    rm -rf /var/lib/apt/lists/*

# Download e instalação do Quarto
RUN curl -L -o quarto-linux-amd64.deb https://quarto.org/download/latest/quarto-linux-amd64.deb && \
    gdebi -n quarto-linux-amd64.deb && rm quarto-linux-amd64.deb

# Instalar o renv
RUN R --silent --slave --no-save --no-restore -e "install.packages('renv')"

# Instale o languageserver do R e suas dependências
RUN R --silent --slave --no-save --no-restore -e "install.packages('languageserver', repos='https://p3m.dev/cran/__linux__/jammy/latest')"

# Instale o TinyTeX e Chromium usando Quarto
RUN quarto install tinytex
RUN quarto install chromium

# Copiar e executar o script de instalação de pacotes R
COPY packages.r /packages.r
RUN Rscript /packages.r

# Exponha a porta 8787 para o RStudio Server
EXPOSE 8787

