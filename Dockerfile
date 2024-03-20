FROM node:latest

# 作業ディレクトリ
WORKDIR /var/www

# ロケールのインストールと設定
RUN apt update && \
    apt -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 && \
    apt -y install vim

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

# Vimインストール
RUN apt install -y vim

# npmアップグレード
RUN npm install -g npm@latest
