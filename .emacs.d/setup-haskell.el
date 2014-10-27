(add-hook 'haskell-mode-hook 'haskell-indent-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(add-hook 'haskell-error-mode-hook 'evil-emacs-state)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(require 'company)

(add-to-list 'company-backends 'company-ghc)
