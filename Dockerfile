# ベースイメージとしてDebian Bookworm Slimを使用
FROM debian:bookworm-slim

# 必要なツールのインストール
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    git \
    graphviz \
    openjdk-17-jre \
    && apt-get clean

# PlantUMLのインストール
RUN curl -o /usr/local/bin/plantuml.jar http://sourceforge.net/projects/plantuml/files/plantuml.jar/download

# PlantUMLの実行用のシェルスクリプトを作成
RUN echo -e '#!/bin/bash\n\njava -jar /usr/local/bin/plantuml.jar "$@"' > /usr/local/bin/plantuml && \
    chmod +x /usr/local/bin/plantuml

# code-serverの最新バージョンをインストール
RUN curl -fsSL https://code-server.dev/install.sh | sh

# 拡張機能のインストール
RUN code-server --install-extension vscjava.vscode-java-pack && \
    code-server --install-extension jebbs.plantuml

# Markdown Preview Enhancedのインストール
RUN code-server --install-extension shd101wyy.markdown-preview-enhanced
RUN code-server --install-extension asciidoctor.asciidoctor-vscode

# PasteImageのインストール
RUN code-server --install-extension mushan.vscode-paste-image

# Draw.io Integrationのインストール
RUN code-server --install-extension hediet.vscode-drawio

# AsciidoctorとAsciidoctor-PlantUMLのインストール
RUN apt-get install -y ruby
RUN gem install asciidoctor asciidoctor-diagram asciidoctor-pdf

# Node.jsとnpmのインストール
RUN apt-get install -y npm

WORKDIR /home/coder
COPY package.json /home/coder
RUN npm install 

# ワークディレクトリを作成
RUN mkdir -p /home/coder/workspace

# ポート8080を公開
EXPOSE 8080

# コンテナ起動時に実行するコマンド
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "password", "/home/coder/workspace"]
