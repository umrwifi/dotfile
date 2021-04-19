(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(html
     emacs-lisp
     helm
     multiple-cursors
     git
     markdown
     org
     (osx :variables osx-command-as       'nil
                   osx-option-as        'meta
                   osx-function-as      nil
                   osx-right-command-as 'left
                   osx-swap-option-and-command nil)
     better-defaults
     auto-completion
     treemacs)
   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))
(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  (setq-default
   dotspacemacs-enable-emacs-pdumper nil
   dotspacemacs-emacs-pdumper-executable-file "emacs"
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-gc-cons '(100000000 0.1)
   dotspacemacs-read-process-output-max (* 1024 1024)
   dotspacemacs-use-spacelpa nil
   dotspacemacs-verify-spacelpa-archives t
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'vim
   dotspacemacs-startup-buffer-show-version t
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-new-empty-buffer-major-mode 'text-mode
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-scratch-buffer-persistent nil
   dotspacemacs-scratch-buffer-unkillable nil
   dotspacemacs-initial-scratch-message nil
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-undecorated-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-enable-server nil
   dotspacemacs-server-socket-dir nil
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil
   dotspacemacs-whitespace-cleanup nil
   dotspacemacs-use-clean-aindent-mode t
   dotspacemacs-swap-number-row nil
   dotspacemacs-zone-out-when-idle nil
   dotspacemacs-pretty-docs nil
   dotspacemacs-home-shorten-agenda-source nil))
(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))
(defun dotspacemacs/user-init ()
(defun open-current-file-in-vim ()
  (interactive)
  (async-shell-command
   (format " '/Applications/neovim.app/Contents/MacOS/Application Stub' +%d %s"
       (+ (if (bolp) 1 0) (count-lines 1 (point)))
       (shell-quote-argument buffer-file-name))))
(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.*\\'" . "open \"%s\"")))
;; proxy
(setq url-proxy-services '(("no_proxy" . "127.0.0.1")
                          ("http" . "127.0.0.1:8001")
                          ("https" . "127.0.0.1:8001")
                          ))
  )
(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )
(defun dotspacemacs/user-config ()
(with-eval-after-load 'org
(setq split-width-threshold 0)
(setq split-height-threshold nil)
(setq org-agenda-start-day "1d")
(setq org-agenda-span 1)
(setq org-agenda-start-on-weekday nil)

(setq org-agenda-custom-commands
    '(
    ("d" "Today Priority"
               (;; important things to do
                (tags-todo "+SCHEDULED<\"<tomorrow>\"+PRIORITY={A}")
                ;; medium important things to do
                (tags-todo "+SCHEDULED<\"<tomorrow>\"+PRIORITY={B}")
                ;; other things to do
                (tags-todo "+SCHEDULED<\"<tomorrow>\"+PRIORITY={C}")))
    ("w" . "任务安排") ; describe prefix "w"
    ("ww" "Actions Grouped by Priority"
               (
                (tags-todo "+SCHEDULED<=\"0\"+PRIORITY={A}")
                (tags-todo "+SCHEDULED<=\"0\"+PRIORITY={B}")
                (tags-todo "+SCHEDULED<=\"0\"+PRIORITY={C}")))
    ))

(setq org-agenda-files (list "~/Documents/todo/inbox.org"
                             "~/Documents/todo/bangumi.org" 
                             "~/Documents/todo/bookmark.org" 
                             "~/Documents/todo/diary.org" 
                             "/Users/admin/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org" 
                             ))
(setq org-default-notes-file "~/Documents/todo/inbox.org")
(setq org-agenda-file-task  "~/Documents/todo/inbox.org")
(setq org-default-bookmark-file "~/Documents/todo/bookmark.org")
(defun my-visit-timestamped-file ()
  "Visit a new file named by the current timestamp"
  (interactive)
  (let* (
        (curr-date-stamp (format-time-string "%Y%m%d-%H%M.org"))
        (file-name (expand-file-name curr-date-stamp "/some/path/")))
  (set-buffer (org-capture-target-buffer org-default-notes-file))
  (goto-char (point-max))))
(setq org-capture-templates
        '(
          ("t" "Todo" entry (file+headline org-default-notes-file "待办事项")
           "* TODO %? %(org-mac-chrome-get-frontmost-url) %i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))"
           )
          ("n" "notes" entry (file+headline org-agenda-file-task "笔记")
           "* %?\n  %i\n %U%(org-mac-chrome-get-frontmost-url)"
           )
          ("i" "ideas" entry (file+headline org-agenda-file-task "收件箱")
           "* %?\n  %i\n %U%(org-mac-chrome-get-frontmost-url)"
           )
          ("d" "dream" entry (file+headline org-agenda-file-task "梦")
           "* %?\n  %i\n %U" )
          ("l" "quick link" plain (file+headline org-default-agenda-file "书签")
           "%(org-mac-chrome-get-frontmost-url)"
           :immediate-finish t
           )
          ("bk" "quick link" plain (file+headline org-default-agenda-file "书签")
           "%(org-mac-chrome-get-frontmost-url)#:~:text=%(evil-paste-after)"
           :immediate-finish t
           )
          ("b" "bookmark describe" plain (file+headline org-default-bookmark-file "书签")
           "%(org-mac-chrome-get-frontmost-url)"
           )
           ("a" "foo" plain
            (function my-visit-timestamped-file)
           "%(org-mac-chrome-get-frontmost-url)"
            )
          )
        )
  )
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
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files
   '("~/Documents/todo/inbox.org" "~/Documents/todo/bangumi.org" "~/Documents/todo/bookmark.org"))
 '(package-selected-packages
   '(pinyin-search  unfill smeargle reveal-in-osx-finder osx-trash osx-dictionary osx-clipboard org-rich-yank org-category-capture org-present gntp org-mime org-download org-cliplink org-brain mwim mmm-mode markdown-mode magit-section launchctl htmlize helm-org-rifle helm-git-grep gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-messenger git-link gh-md fuzzy evil-org transient company yasnippet auto-complete ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil toc-org symon symbol-overlay string-inflection spaceline-all-the-icons restart-emacs request rainbow-delimiters popwin pcre2el password-generator paradox overseer org-superstar open-junk-file nameless move-text macrostep lorem-ipsum link-hint indent-guide hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag google-translate golden-ratio font-lock+ flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-easymotion evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav editorconfig dumb-jump dotenv-mode dired-quick-sort diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile aggressive-indent ace-link ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
