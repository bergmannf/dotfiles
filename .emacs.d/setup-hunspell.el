(require 'ispell)

(setq ispell-program-name (executable-find "hunspell"))

(setq ispell-dictionary "en_US")

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
