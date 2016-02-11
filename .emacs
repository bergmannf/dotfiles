(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#5f5f5f" "#ff4b4b" "#a1db00" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#ffffff"])
 '(background-mode dark)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-blue)))
 '(custom-safe-themes (quote ("3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" default)))
 '(delete-selection-mode nil)
 '(global-auto-revert-mode t)
 '(helm-external-programs-associations (quote (("mp4" . "smplayer"))))
 '(linum-format " %4i ")
 '(mark-even-if-inactive t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(venv-location "/home/florian/venv/"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Mono" :foundry "unknown" :slant normal :weight normal :height 97 :width normal)))))

;; Add PATH to the PATH emacs uses internally.
(setenv "PATH"
        (concat
         (expand-file-name "~/bin/") ":"
         (getenv "PATH")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. Keybinding and general Emacs settings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Setup the backup directory (#<filename>#-files)
(setq backup-directory-alist '(("." . "~/.saves")))

;; Make <ret> always indent on newline
(define-key global-map (kbd "RET") 'newline-and-indent)

(line-number-mode 1)	;; Set linenumbers to on
(column-number-mode 1)	;; Column number in mode-line
(global-hl-line-mode)	;; Highlight current line
(global-linum-mode 1)	;; Display line numbers

;; Do not use tabs for indention
(setq-default indent-tabs-mode nil)

;; default key to switch buffer is C-x b, but that's not easy enough
;;
;; when you do that, to kill emacs either close its frame from the window
;; manager or do M-x kill-emacs.  Don't need a nice shortcut for a once a
;; week (or day) action.
(global-set-key (kbd "C-x C-b") 'list-buffers)
(global-set-key (kbd "C-x B") 'ibuffer)

;; Visual cues for parentheses:
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'parenthesis) ;; alternative would be 'expression

;; Load changes from disk
(global-auto-revert-mode 1)

;; Set firefox-browser as default browser
(setq gnus-button-url 'browse-url-generic
      browse-url-generic-program "firefox"
      browse-url-browser-function gnus-button-url)

;; Setup whitespace mode to highlight trailing after the 80 character column.
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; M-x shell is a nice shell interface to use, let's make it colorful.  If
;; you need a terminal emulator rather than just a shell, consider M-x term
;; instead.
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Setup markdown mode for stackoverflow.
(add-to-list 'auto-mode-alist '("stack\\(exchange\\|overflow\\)\\.com\\.[a-z0-9]+\\.txt" . markdown-mode))
(put 'dired-find-alternate-file 'disabled nil)

(define-coding-system-alias 'UTF-8 'utf-8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. Package management setup ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file "~/.emacs.d/setup-packages.el")

(load-file "~/.emacs.d/setup-yasnippet.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. Load complex external setup-config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Extend emacs path
(load "~/.emacs.d/setup-path.el")

;; Load evil-config
(load "~/.emacs.d/setup-evil.el")

;; Load clojure-config
(load "~/.emacs.d/setup-clojure.el")

;; Load auto-complete-setup
;; (load "~/.emacs.d/setup-auto-complete.el")
(load "~/.emacs.d/setup-company.el")

;; Load python-setup
(load "~/.emacs.d/setup-python.el")

;; Setup ERC
(load "~/.emacs.d/setup-erc.el")

(load "~/.emacs.d/setup-ediff.el")

(load "~/.emacs.d/setup-ido.el")

;; Setup flycheck
(load "~/.emacs.d/setup-flycheck.el")

(load "~/.emacs.d/setup-helm.el")

(load "~/.emacs.d/setup-html.el")

(load "~/.emacs.d/setup-emms.el")

(load "~/.emacs.d/setup-auctex.el")

(load "~/.emacs.d/setup-haskell.el")

(load "~/.emacs.d/setup-scala.el")

(load "~/.emacs.d/setup-smartparens.el")

(load "~/.emacs.d/setup-hunspell.el")

(load "~/.emacs.d/setup-sml.el")

(load "~/.emacs.d/setup-org.el")

(load "~/.emacs.d/setup-ace.el")

(setq backup-directory-alist
      '(("." . "~/.saves")))

(smartparens-global-mode 1)

(load-theme 'zenburn)

(server-start)

(provide '.emacs)
;;; .emacs ends here
