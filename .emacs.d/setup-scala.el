(require 'ensime)

; Hooks

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(add-hook 'scala-mode-hook #'yas-minor-mode)

; Keymaps

(define-key company-active-map [tab] nil)
