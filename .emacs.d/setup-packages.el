(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(haskell-mode . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(ghc . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(company-ghc . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(emmet-mode . "marmalade") t)

(package-initialize)

(setq elpa-list '(ace-window
                  anaconda-mode
                  auctex
                  cider
                  company
                  company-anaconda
                  company-ghc
                  emmet-mode
                  emms
                  ess
                  evil
                  flycheck
                  ghc
                  geiser
                  haskell-mode
                  helm
                  helm-projectile
                  htmlize
                  kivy-mode
                  magit
                  markdown-mode
                  moe-theme
                  multiple-cursors
                  ox-reveal
                  projectile
                  quack
                  rainbow-delimiters
                  smartparens
                  sml-mode
                  solarized-theme
                  web-mode
                  virtualenvwrapper
                  yasnippet
                  zenburn-theme))

(mapc (lambda (package)
          (when (not (package-installed-p package))
            (package-install package))) elpa-list)
