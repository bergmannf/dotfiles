(when (require 'flycheck nil 'noerror)
  (add-hook 'after-init-hook #'global-flycheck-mode))
