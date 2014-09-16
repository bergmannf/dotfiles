(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(setq cider-repl-print-length 100)

;; Setup rainbow-delimiters

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
