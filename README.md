# dot-files

Install Vundle
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

After downloading .vimrc run
```bash
vim +PluginInstall +qa
```
to install pulgins.

To get YouCompleteMe to work:
  1. install python headers
    ```bash
    apt-get install python-dev
    ```
  2. install YCM
    ```bash
    ./~/.vim/bundle/YouCompleteMe/install.py
    ```
  3. For JS syntax highlighting install typescript.
    ```bash
    npm install -g typescript
    ```
