FROM node:alpine AS setup

WORKDIR /usr/src/app

# Node Toolchain
# RUN apk update && apk add --no-cache nodejs npm && apk upgrade

# Python Toolchain
# RUN apk update && apk add --no-cache python3 py3-pip && apk upgrade

# Docker Toolchain
# RUN sh -c "$(curl -fsSL https://get.docker.com -o get-docker.sh)"
# RUN apk update && apk add --no-cache docker-cli && apk upgrade
# RUN addgroup username docker
# RUN rc-update add docker boot
RUN apk update && apk add --no-cache docker && apk upgrade

# Basic alpine commands
RUN apk update && apk add --no-cache util-linux grep && apk upgrade

# Develop Tools
RUN apk update && apk add --no-cache git curl zsh vim expect && apk upgrade
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/reobin/typewritten.git /root/.oh-my-zsh/custom/themes/typewritten
# RUN git clone --depth=1 https://github.com/pindexis/marker /root/.marker && /root/.marker/install.py
RUN ln -s "/root/.oh-my-zsh/custom/themes/typewritten/typewritten.zsh-theme" "/root/.oh-my-zsh/custom/themes/typewritten.zsh-theme"
ADD .devcontainer/.zshrc /root
ADD .devcontainer/.zsh-theme /root/.oh-my-zsh

# replace this with your application's default port
EXPOSE 3000

CMD [ "/bin/zsh" ]