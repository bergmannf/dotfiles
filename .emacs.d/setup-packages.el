(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq elpa-list '(
                  anaconda-mode
                  auctex
                  cider
                  clojure-mode
                  company
                  company-anaconda
                  emms
                  ess
                  evil
                  flycheck
                  geiser
                  helm
                  kivy-mode
                  magit
                  markdown-mode
                  moe-theme
                  multiple-cursors
                  quack
                  rainbow-delimiters
                  smartparens
                  sml-mode
                  solarized-theme
                  web-mode
                  virtualenvwrapper
                  yasnippet
                  zenburn-theme
                  ))

(mapc (lambda (package)
          (when (not (package-installed-p package))
            (package-install package))) elpa-list)
