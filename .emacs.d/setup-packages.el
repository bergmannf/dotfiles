(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(setq package-pinned-packages '((cider . "melpa-stable")
                                (company-ghc . "melpa-stable")
                                (emmet-mode . "marmalade")
                                (evil . "melpa-stable")
                                (ghc . "melpa-stable")
                                (haskell-mode . "melpa-stable")
                                (helm . "melpa-stable")
                                (magit . "melpa-stable")
                                (magit-popup . "melpa-stable")
                                (yasnippet . "melpa-stable")))

(package-initialize)
(package-refresh-contents)

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
                  haskell-mode
                  helm
                  helm-projectile
                  htmlize
                  magit
                  markdown-mode
                  moe-theme
                  multiple-cursors
                  ox-reveal
                  projectile
                  rainbow-delimiters
                  smartparens
                  solarized-theme
                  web-mode
                  virtualenvwrapper
                  yasnippet
                  zenburn-theme))

(mapc (lambda (package)
          (when (not (package-installed-p package))
            (package-install package))) elpa-list)
