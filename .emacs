(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-mode dark)
 '(custom-enabled-themes (quote (moe-light)))
 '(delete-selection-mode nil)
 '(global-auto-revert-mode t)
 '(linum-format " %4i ")
 '(mark-even-if-inactive t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 )
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

;; Make diff easier to use in tiling window managers
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

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

;; use ido for minibuffer completion
(require 'ido)
(ido-mode t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Setup markdown mode for stackoverflow.
(add-to-list 'auto-mode-alist '("stack\\(exchange\\|overflow\\)\\.com\\.[a-z0-9]+\\.txt" . markdown-mode))
(put 'dired-find-alternate-file 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. Package management setup ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file "~/.emacs.d/setup-packages.el")

(load-file "~/.emacs.d/setup-yasnippet.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. Load complex external setup-config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load evil-config
(load "~/.emacs.d/setup-evil.el")

;; Load clojure-config
(load "~/.emacs.d/setup-clojure.el")

;; Load auto-complete-setup
(load "~/.emacs.d/setup-auto-complete.el")

;; Load python-setup
(load "~/.emacs.d/setup-python.el")

;; Setup ERC
(load "~/.emacs.d/setup-erc.el")

;; Setup flycheck
(load "~/.emacs.d/setup-flycheck.el")

(setq backup-directory-alist
      '(("." . "~/.saves")))

(smartparens-global-mode 1)

(require 'moe-theme)
(moe-light)

(provide '.emacs)
;;; .emacs ends here
