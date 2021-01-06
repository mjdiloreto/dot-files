;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     yaml
     lsp
     python
     (python :variables
             python-sort-imports-on-save t
             python-fill-column 80
             python-tab-width 4
             python-format-on-save t)
     javascript
     import-js
     (javascript :variables
                 ;; packages
                 javascript-import-tool 'import-js
                 javascript-repl 'nodejs
                 javascript-fmt-tool 'prettier
                 ;javascript-backend 'tern  ;; Actually it seems like tern is busted.
                 javascript-backend 'lsp  ;; Use lsp (default) instead
                 javascript-lsp-server 'javascript-typescript-langserver
                 javascript-lsp-linter nil
                 ;; configuration
                 js2-basic-offset 4  ; code indent
                 js-indent-level 4  ; JSON indent
                 css-indent-offset 4
                 web-mode-markup-indent-offset 4
                 web-mode-css-indent-offset 4
                 web-mode-code-indent-offset 4
                 web-mode-attr-indent-offset 4
                 js2-mode-show-strict-warnings nil ; to get prevent Flow from being erroneously checked
                 js2-mode-show-parse-errors nil ; same as above
                 ;; javascript-fmt-on-save t
                 )
     react
     markdown
     php
     html
     clojure
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;;better-defaults
     emacs-lisp
     ;; git
     ;; markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;;spell-checking
     syntax-checking
     neotree
     ;; version-control
     ;org-configs ;; Added by me. Tried to customize org-mode inside layer. This won't work.
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ox-hugo
                                      magit
                                      helm-ag
                                      dash-at-point
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; needed or else test fail
   dotspacemacs-mode-line-theme 'spacemacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 11
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers 'relative 
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

    (setf user-full-name "Matthew DiLoreto")
    (setf user-mail-address "mjdiloreto@gmail.com")

    ;; activate debugging
    (setq debug-on-error nil
          debug-on-signal nil
          debug-on-quit nil)

    ;; Resume from the last saved layout always.
    (setq dotspacemacs-auto-resume-layouts t)

    ;; Do not create lockfiles
    (setq create-lockfiles nil)

    ;;; YASnippet config

    ;; Add YASnippets to these minor modes
    ;(yas-reload-all) ; TODO void function
    (add-hook 'js2-mode-hook #'yas-minor-mode)
    (add-hook 'rjsx-mode-hook #'yas-minor-mode)
    (add-hook 'scss-mode-hook #'yas-minor-mode)

    (define-key yas-minor-mode-map (kbd "s-TAB") ; `yas-maybe-expand' new in 0.12
      (or (bound-and-true-p yas-maybe-expand) #'yas-expand))
    (define-key yas-minor-mode-map (kbd "<backtab>") ; `yas-maybe-expand' new in 0.12
      (or (bound-and-true-p yas-maybe-expand) #'yas-expand))

    ;;(define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand) ; TODO figure out why this doesn't work.
    ;; Bind `C-x y' to `yas-expand' ONLY.
    (global-set-key (kbd "C-x y") #'yas-expand)

    ;; Allow nested yasnippets
    (setq yas-triggers-in-field t)

    ;; Use golden-ratio window resizing
    (golden-ratio-mode 1)

    ;; TODO /*org-startup-with-inline-images (not needed anymore (set in STARTUP buffer option))*/ and iscroll.el
    ;;; Org Mode config
    ;; Create Note template every day.
    (setq org-capture-templates
          '(("l"
             "Date log"
             entry
             (file "~/Documents/paz_notes.org")
             "* Day %t")))

    ;;; Language server configuration
    ;; (setq lsp-eslint-server-command
    ;;       '("node"
    ;;         "/Users/e5629170/programs/vscode-eslint/server/out/eslintServer.js"
    ;;         "--stdio"))

    ;;; Custom commands
    ;; https://stackoverflow.com/questions/2219537/how-to-get-selected-text-in-emacs-lisp
    (defun get-selected-text (start end)
      (interactive "r")
      (if (use-region-p)
          (let ((regionp (buffer-substring start end)))
            (message regionp))
          (message (thing-at-point 'symbol t)))) ;; NO-PROPERTIES for just the text and no metadata.

    (defun rgrep-this-at-paz-root-js (start end)
      (interactive "r")
      (progn
        (grep-compute-defaults)
        (rgrep (get-selected-text start end) "*.js" "/Users/e5629170/Pazien/web-application/webapplication/static/js" nil)))
    (defun rgrep-this-at-paz-root (start end)
      (interactive "r")
      (progn
        (grep-compute-defaults)
        (rgrep (get-selected-text start end) "* .[!.]* ..?*" "/Users/e5629170/Pazien/web-application/webapplication/static/js" nil)))

    (defun rgrep-at-paz-root-js ()
      (interactive)
      (progn
        (grep-compute-defaults)
        (let ((thing (read-string "search for: ")))
          (rgrep thing "*.js" "/Users/e5629170/Pazien/web-application/webapplication/static/js" nil))))
    (defun rgrep-at-paz-root ()
      (interactive)
      (progn
        (grep-compute-defaults)
        (let ((thing (read-string "search for: ")))
          (rgrep thing  "* .[!.]* ..?*" "/Users/e5629170/Pazien/web-application/webapplication/static/js" nil))))

;    (defun find-this-in-page) maybe just use =g *= or =g #= and define global syntax to consider - and _ in words.

    (defun follow-import-at-point ()
      (interactive)
      (let* ((file-to-search (thing-at-point 'filename t))
             (project-root (projectile-ensure-project (projectile-project-root)))
             (file (projectile-completing-read "Follow import: "
                                               (projectile-project-files project-root)
                                               :initial-input file-to-search)))
        (when file
          (find-file (expand-file-name file project-root))
          (run-hooks 'projectile-find-file-hook))))

    (defun find-implementation-at-point ()
      "Since ts/js lsp server does not support finding implementations. Lame for not jumping directly to definition."
      (interactive)
      (let (child-name (get-selected-text))
        (spacemacs/jump-to-definition)
        (search-forward "\"")
        (let* ((file-to-search (thing-at-point 'filename t))
               (project-root (projectile-ensure-project (projectile-project-root)))
               (file (projectile-completing-read (format "%s defined in: " child-name)
                                                 (projectile-project-files project-root)
                                                 :initial-input file-to-search)))
          (when file
            (find-file (expand-file-name file project-root))
            (run-hooks 'projectile-find-file-hook)))))

    (defun find-imports-of-this-file ()
      "TODO Modify to create command to filter files that reference the thing-at-point as well.
       NOTE: I thing rgrep-this-at-paz-root-js is more effective than this approach."
      (interactive)
      (let* (;(child-name (get-selected-text))
             (path (buffer-file-name))
             (project-root (projectile-ensure-project (projectile-project-root)))
             (rel-path (substring path 0 -3))) ; remove ".js"
        (progn
          (grep-compute-defaults)
          (rgrep rel-path "* .[!.]* ..?*" "/Users/e5629170/Pazien/web-application/webapplication/static/js" nil))))

    ;; The following 2 functions allow editing styled components with all scss mode features.
    (defun edit-styled-component ()
      (interactive)
      (progn
        (save-excursion
          (let ((start (search-backward "`"))
                (end (search-forward "`" nil nil 2))) ; second occurrence, since first is `start'
            (narrow-to-region start end)))
        (scss-mode)))

    (spacemacs/set-leader-keys-for-major-mode 'rjsx-mode
      "ms" 'edit-styled-component)

    ;; When editing is done, use the same key sequence to return to the original file.
    (defun return-from-styled-component ()
      (interactive)
      (progn
        (widen)
        (rjsx-mode)))

    (spacemacs/set-leader-keys-for-major-mode 'scss-mode
      "ms" 'return-from-styled-component)

    ;;; Replacing wrapping characters
    (defun replace-wrap (goto-previous-wrapping-character-fn new-opening-character new-closing-character)
      (save-excursion
        (progn
          (funcall goto-previous-wrapping-character-fn)
          (let ((first-paren (point)))
            (progn
              (evilmi-jump-items)
              (delete-char 1)
              (insert new-closing-character)
              (goto-char first-paren)
              (delete-char 1)
              (insert new-opening-character))))))

    (defun replace-wrap-paren->curly ()
      (interactive)
      (replace-wrap 'evil-previous-open-paren "{" "}"))
    (defun replace-wrap-paren->square ()
      (interactive)
      (replace-wrap 'evil-previous-open-paren "[" "]"))
    
    (defun replace-wrap-curly->paren ()
      (interactive)
      (replace-wrap 'evil-previous-open-brace "(" ")"))
    (defun replace-wrap-curly->square ()
      (interactive)
      (replace-wrap 'evil-previous-open-brace "[" "]"))


    ;;; Personal bindings
    (defun set-personal-bindings-for-major-mode (mode)
      (spacemacs/set-leader-keys-for-major-mode mode
        "mj" 'rgrep-this-at-paz-root-js
        "mJ" 'rgrep-at-paz-root-js
        "ma" 'rgrep-this-at-paz-root
        "mA" 'rgrep-at-paz-root
        "m/" 'isearch-forward-symbol-at-point
        "mi" 'find-implementation-at-point
                                        ;"mI" 'find-imports-of-this-file
        "mf" 'follow-import-at-point
        "m{" 'replace-wrap-paren->curly
        "m(" 'replace-wrap-curly->paren
        "m[(" 'replace-wrap-paren->square
        "m[{" 'replace-wrap-curly->square
        "md" 'dash-at-point))

    (set-personal-bindings-for-major-mode 'js2-mode)
    (set-personal-bindings-for-major-mode 'rjsx-mode)
    (set-personal-bindings-for-major-mode 'scss-mode)


    
    ;;; Global keybindings
    ;; Magit configuration
    (global-set-key (kbd "C-x q") 'evil-ex-search-exit) ; Stop search when it is borked.
    ;; (global-set-key (kbd "C-x p") 'projectile-find-file) ; use SPC-/ instead (search project - uses helm-ag behind the scenes)

    (defun yank-magit-file-relative-name ()
      "Copy the name of the current file relative to the parent git repository. Useful for diffing with magit. =d --="
      (interactive)
      (kill-new (magit-file-relative-name)))

    ;; From https://stackoverflow.com/questions/3417438/close-all-buffers-besides-the-current-one-in-emacs
    (defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer
            (delq (current-buffer)
                  (remove-if-not 'buffer-file-name (buffer-list)))))

    (spacemacs/set-leader-keys
      "gg" 'magit-status
      "gb" 'magit-blame-addition
      "gq" 'magit-blame-quit
      "gf" 'yank-magit-file-relative-name
      "qb" 'kill-other-buffers
      "qa" 'delete-other-windows
      )

    (global-set-key (kbd "s-.") 'evil-jump-backward)
    (global-set-key (kbd "s-/") 'evil-jump-forward)

    ;; Use windmove. Shift-arrow >>> SPC-w-arrow
    (global-set-key (kbd "<S-down>") 'windmove-down)
    (global-set-key (kbd "<S-up>") 'windmove-up)
    (global-set-key (kbd "<S-right>") 'windmove-right)
    (global-set-key (kbd "<S-left>") 'windmove-left)
    (global-set-key (kbd "<M-S-right>") 'split-window-right-and-focus)
    (global-set-key (kbd "<M-S-down>") 'split-window-below-and-focus)

    )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(import-js yaml-mode dash-at-point flycheck-pos-tip pos-tip flycheck lsp-mode ht tern sesman queue parseedn clojure-mode parseclj a yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot git-commit with-editor transient magit helm-company helm-c-yasnippet fuzzy company-web company-tern web-completion-data dash-functional company-statistics clojure-snippets auto-yasnippet ac-ispell auto-complete company web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc coffee-mode mmm-mode markdown-toc markdown-mode gh-md ox-hugo phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode clj-refactor inflections multiple-cursors paredit yasnippet cider-eval-sexp-fu cider ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(safe-local-variable-values '((cider-shadow-cljs-default-options . "app"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)
 '(org-agenda-files '("~/Documents/paz_notes.org"))
 '(package-selected-packages
   '(dash-at-point flycheck-pos-tip pos-tip flycheck lsp-mode ht tern sesman queue parseedn clojure-mode parseclj a yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot git-commit with-editor transient magit helm-company helm-c-yasnippet fuzzy company-web company-tern web-completion-data dash-functional company-statistics clojure-snippets auto-yasnippet ac-ispell auto-complete company web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc coffee-mode mmm-mode markdown-toc markdown-mode gh-md ox-hugo phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode clj-refactor inflections multiple-cursors paredit yasnippet cider-eval-sexp-fu cider ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(safe-local-variable-values '((cider-shadow-cljs-default-options . "app")))
 '(sgml-basic-offset 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
