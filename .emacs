(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-term-color-vector [unspecified "#383830" "#f92672" "#a6e22e" "#f4bf75" "#66d9ef" "#ae81ff" "#66d9ef" "#f5f4f1"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (noctilux)))
 '(custom-safe-themes (quote ("88d556f828e4ec17ac074077ef9dcaa36a59dccbaa6f2de553d6528b4df79cbd" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "978ff9496928cc94639cb1084004bf64235c5c7fb0cfbcc38a3871eb95fa88f6" "f41fd682a3cd1e16796068a2ca96e82cfd274e58b978156da0acce4d56f2b0d5" "405fda54905200f202dd2e6ccbf94c1b7cc1312671894bc8eca7e6ec9e8a41a2" "ae8d0f1f36460f3705b583970188e4fbb145805b7accce0adb41031d99bd2580" "51bea7765ddaee2aac2983fac8099ec7d62dff47b708aa3595ad29899e9e9e44" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" "9bac44c2b4dfbb723906b8c491ec06801feb57aa60448d047dbfdbd1a8650897" default)))
 '(delete-selection-mode nil)
 '(font-use-system-font nil)
 '(global-auto-revert-mode t)
 '(inferior-lisp-program "clisp")
 '(mark-even-if-inactive t)
 '(org-agenda-files (quote ("~/Documents/books.org")))
 '(rst-level-face-base-color "black")
 '(scroll-bar-mode (quote right))
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "adobe" :slant normal :weight normal :height 97 :width normal)))))

(setenv "PATH"
        (concat
         "~/bin/" ":"
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

;; Set chromium-browser as default browser
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. Package management setup ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq elpa-list '(
                  auctex
                  ac-nrepl
                  auto-complete
                  base16-theme
                  clojure-mode
                  ein
                  evil
                  helm
                  magit
                  markdown-mode
                  multiple-cursors
                  nrepl
                  paredit
                  rainbow-delimiters
                  yasnippet
                  ))

(mapcar (lambda (package)
          (when (not (package-installed-p package))
            (package-install package))) elpa-list)

(require 'yasnippet)
(yas/global-mode 1)

;; use ido for minibuffer completion
(require 'ido)
(ido-mode t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; Setup markdown mode for stackoverflow.
(add-to-list 'auto-mode-alist '("stack\\(exchange\\|overflow\\)\\.com\\.[a-z0-9]+\\.txt" . markdown-mode))
(put 'dired-find-alternate-file 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. Load complex external setup-config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load evil-config
(load "~/.emacs.d/setup-evil.el")

;; Load clojure-config
(load "~/.emacs.d/setup-clojure.el")

;; Load auto-complete-setup
(load "~/.emacs.d/setup-auto-complete.el")
(put 'erase-buffer 'disabled nil)
(load-theme 'base16-monokai)
(put 'narrow-to-region 'disabled nil)
