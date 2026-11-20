alias nvimr="NVIM_APPNAME='rownvim' nvim"
alias py="python3"
alias cat="bat --style=plain --paging=never"

42zsh_update() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/nilcube/42_config/master/zsh/setup.sh)"
}


librewolf() {
  mkdir -p $HOME/goinfre/flatpak
  flatpak install --user -y "https://dl.flathub.org/repo/appstream/io.gitlab.librewolf-community.flatpakref"
  flatpak update -y io.gitlab.librewolf-community
  setsid flatpak run io.gitlab.librewolf-community
  exit
}


vi () {
  if ! docker image inspect nvim > /dev/null; then
    tmp_file=$(mktemp)
    curl -fsSL "https://raw.githubusercontent.com/nilcube/42_config/master/nvim/Dockerfile" -o "$tmp_file"
    docker build -t nvim -f "$tmp_file" .
  fi
    docker run -it --rm \
      -v "$(pwd)":/app \
      -v nvim_container_home:/root/.local \
      -v "$HOME/.config/nvim":/root/.config/nvim \
      nvim $@
}


goinfre_use() {
  CWD=$(pwd)
  cd ~/goinfre
  print -n "Your use: "
  du -h 2> /dev/null | tail -n 1|awk '{print $1}'
  df -h |grep "/goinfre" | awk '{print "Available: " $4}'

  cd $CWD
}


__norm (){
  CWD=$(pwd)

  while [[ ! -d ".git" ]]; do
    cd ..
    if [[ $(pwd) == / ]]; then
      echo "Can't find .git repo"
      break
    fi
  done
  norminette $(find . \( -name "*.c" -o -name "*.h" \) -and -type f -and ! -name "_*" )
  cd $CWD
}

if command -v lsd> /dev/null 2>&1; then
  alias ls="lsd"
fi
