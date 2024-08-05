curl https://pyenv.run | bash


export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


source ~/.bashrc

pyenv install 3.9.7
pyenv global 3.9.7



pip install TTS