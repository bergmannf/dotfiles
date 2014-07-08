(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq elpa-list '(
                  ac-nrepl
                  auctex
                  auto-complete
                  cider
                  clojure-mode
                  ein
                  ess
                  evil
                  jedi
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
                  solarized-theme
                  web-mode
                  yasnippet
                  zenburn-theme
                  ))

(mapc (lambda (package)
          (when (not (package-installed-p package))
            (package-install package))) elpa-list)
