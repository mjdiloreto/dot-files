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

Installing spacemacs (for Mac):
1. install emacs-plus@27. `brew install emacs-plus@27`
2. install spacemacs develop branch. `git clone https://github.com/syl20bnr/spacemacs ~/.emacs. && pushd ~/.emacs.d && git checkout develop && popd`
3. cp .spacemacs.work ~/.spacemacs
4. launch spacemacs

