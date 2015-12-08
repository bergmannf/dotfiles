;; Set-up packages downloaded via el-get

(require 'auto-complete-config)

(ac-config-default)
(set-default
 'ac-sources
 (append ac-sources '(ac-source-filename ac-source-files-in-current-dir)))
(define-key ac-mode-map (kbd "<C-tab>") 'auto-complete)
(ac-set-trigger-key "TAB")
(setq ac-auto-start 2)
