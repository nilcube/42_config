FROM ubuntu:26.10



# update the system.
RUN apt update && apt full-upgrade -y



# install neovim & tools.
RUN apt install -y git wget curl unzip nodejs npm
RUN apt install -y tree-sitter-cli ripgrep
RUN apt install -y neovim



WORKDIR "/app"

ENTRYPOINT ["nvim"]


