(require 'package)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(setq auto-save-default nil) ;;关闭自动保存
(global-set-key [C-c tab] 'org-force-cycle-archived)
;;org capture
(require 'mouse) 
(xterm-mouse-mode t) 
(defun track-mouse (e)) 
(setq mouse-sel-mode t) 
;; 在mac下显示中文字体 
;;(set-fontset-font (frame-parameter nil 'font) 'han (font-spec :family "Hiragino Sans GB" ))
;; 在 Spacemacs 中设置归档命令的快捷键
;; 配置归档文件的名称和Headline格式
(setq org-archive-location "%s_archive::date-tree")
(setq org-default-notes-file "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org")
(setq-default org-agenda-dir "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/")
(setq org-agenda-file-task (expand-file-name "todo.org" org-agenda-dir))
(setq org-capture-templates
        '(
          ("t" "Todo" entry (file+headline org-default-notes-file "今天")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1)
          ("n" "notes" entry (file+headline org-agenda-file-task "今天")
           "* %?\n  %i\n %U"
           :empty-lines 1)
          ("i" "ideas" entry (file+headline org-agenda-file-task "收件箱")
           "* %?\n  %i\n %U"
           :empty-lines 1)
          )
        )
(setq org-agenda-files (append
			(file-expand-wildcards "/Users/admin/Library/Mobile\ Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org")
			)
)
;(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
;(require 'evil-org)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "332e009a832c4d18d92b3a9440671873187ca5b73c2a42fbd4fc67ecf0379b8c" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "f951343d4bbe5a90dba0f058de8317ca58a6822faa65d8463b0e751a07ec887c" "2a3ffb7775b2fe3643b179f2046493891b0d1153e57ec74bbe69580b951699ca" "f2b83b9388b1a57f6286153130ee704243870d40ae9ec931d0a1798a5a916e76" default)))
 '(org-agenda-files
   (quote
    ("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org")))
 '(package-selected-packages
   (quote
    (## helm monokai-theme doom-themes theme-changer evil-terminal-cursor-changer))))
(load-theme 'wombat t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(tool-bar-mode 0)
(menu-bar-mode 0)
;;start 设置剪切板共享 
(defun copy-from-osx () 
(shell-command-to-string "pbpaste")) 
(defun paste-to-osx (text &optional push) 
(let ((process-connection-type nil)) 
(let ((proc (start-process"pbcopy" "*Messages*" "pbcopy"))) 
(process-send-string proc text) 
(process-send-eof proc)))) 
(setq interprogram-cut-function 'paste-to-osx) 
(setq interprogram-paste-function 'copy-from-osx) 
;;end 设置剪切板共享
