;; Set-up packages downloaded via el-get
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-mode-map (kbd "<C-tab>") 'auto-complete)
(ac-set-trigger-key "TAB")
(setq ac-auto-start t)
