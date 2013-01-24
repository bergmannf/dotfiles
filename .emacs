(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(ansi-term-color-vector ["#3f3f3f" "#cc9393" "#7f9f7f" "#f0dfaf" "#8cd0d3" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes (quote ("27470eddcaeb3507eca2760710cc7c43f1b53854372592a3afa008268bcf7a75" "e9a1226ffed627ec58294d77c62aa9561ec5f42309a1f7a2423c6227e34e3581" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" "21d9280256d9d3cf79cbcf62c3e7f3f243209e6251b215aede5026e0c5ad853f" default)))
 '(fci-rule-color "#383838")
 '(global-auto-revert-mode t)
 '(inferior-lisp-program "clisp")
 '(org-agenda-files (quote ("~/Documents/books.org")))
 '(rst-level-face-base-color "black")
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))

(setenv "PATH" (concat "~/Scripts/sbt/bin/" ":" (getenv "PATH")))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq elpa-list '(auto-complete
                  clojure-mode
                  evil
                  helm
                  magit
                  markdown-mode
                  nrepl
                  scala-mode2
                  sml-mode
                  yasnippet
                  ))

(mapcar (lambda (package)
          (when (not (package-installed-p package))
            (package-install package))) elpa-list)

;; Set-up packages downloaded via el-get
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-mode-map (kbd "<C-tab>") 'auto-complete)
(ac-set-trigger-key "TAB")
(setq ac-auto-start t)
(require 'yasnippet)
(yas/global-mode 1)
;; Always turn on evil mode
(evil-mode 1)

;; Add projectile and set up keyboard shortcuts.
(add-to-list 'load-path "~/.emacs.d/site-packages/projectile/")
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'helm-projectile)
(global-set-key (kbd "C-c h") 'helm-projectile)

; make "kj" behave as ESC key ,adapted from http://permalink.gmane.org/gmane.emacs.vim-emulation/
; you can easily change it to map "jj" or "kk" or "jk" to ESC)
(define-key evil-insert-state-map "j" #'cofi/maybe-exit)

(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?k)
			   nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?k))
	(delete-char -1)
	(set-buffer-modified-p modified)
	(push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
					      (list evt))))))))

(line-number-mode 1)	;; Set linenumbers to on
(column-number-mode 1)	;; Column number in mode-line
(global-hl-line-mode)	;; Highlight current line
(global-linum-mode 1)	;; Display line numbers

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

;; default key to switch buffer is C-x b, but that's not easy enough
;;
;; when you do that, to kill emacs either close its frame from the window
;; manager or do M-x kill-emacs.  Don't need a nice shortcut for a once a
;; week (or day) action.
(global-set-key (kbd "C-x C-b") 'list-buffers)
(global-set-key (kbd "C-x B") 'ibuffer)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; Setup the backup directory (#<filename>#-files)
(setq backup-directory-alist '(("." . "~/.saves")))

;; Make <ret> always indent on newline
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Setting up python-for-emacs
;; (load-file ".emacs.d/emacs-for-python/epy-init.el")

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
      browse-url-generic-program "chromium-browser"
      browse-url-browser-function gnus-button-url)

;; Setup whitespace mode to highlight trailing after the 80 character column.
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; Do not use tabs for indention
(setq-default indent-tabs-mode nil)

(add-to-list 'load-path "~/.emacs.d/site-packages/python/")
(require 'python)

(add-to-list 'load-path "~/.emacs.d/site-packages/ensime/elisp")
(require 'ensime)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(put 'erase-buffer 'disabled nil)

;; Setup markdown mode for stackoverflow.
(add-to-list 'auto-mode-alist '("stack\\(exchange\\|overflow\\)\\.com\\.[a-z0-9]+\\.txt" . markdown-mode))
(put 'dired-find-alternate-file 'disabled nil)
