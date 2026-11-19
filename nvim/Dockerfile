FROM ubuntu:latest


# update the system.
RUN apt update && apt full-upgrade -y



# install neovim & tools.
RUN apt install -y neovim
RUN apt install -y git wget curl



# setup nvim config.
RUN git clone https://github.com/nilcube/nvim.git ~/.config/nvim

WORKDIR "/app"

ENTRYPOINT ["nvim"]


