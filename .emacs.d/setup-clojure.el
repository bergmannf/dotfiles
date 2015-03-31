(require 'cider)
(require 'evil)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(add-to-list 'evil-emacs-state-modes 'cider-stacktrace-mode)
(add-to-list 'evil-emacs-state-modes 'cider-test-report-mode)
(add-hook 'cider-doc-mode-hook 'evil-emacs-state)

(setq cider-repl-print-length 100)

;; Setup rainbow-delimiters

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
