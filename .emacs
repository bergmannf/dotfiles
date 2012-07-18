(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(ede-project-directories (quote ("/home/florian/Code/pydoro"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Obtain el-get package management.
(add-to-list 'load-path "~/.emacs.d/el-get/el-get") 
(unless (require 'el-get nil t) 
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
   (let (el-get-master-branch)
     (goto-char (point-max))
     (eval-print-last-sexp)))))

;; Setup packages to fetch via el-get
(setq
 my:el-get-packages
 '(el-get
   auto-complete
   zencoding-mode
   yasnippet
   haskell-mode
   evil
   nxhtml
   anything
   magit))

(setq my:el-get-packages
      (append
       my:el-get-packages
       (loop for src in el-get-sources collect (el-get-source-name src))))

(print my:el-get-packages)
;; Dependencies for el-get package management.
;; install new packages and init already installed packages
(el-get 'sync my:el-get-packages)`

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Set-up packages downloaded via el-get
(require 'yasnippet)
(yas/global-mode 1)

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
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x C-c") 'ido-switch-buffer)
(global-set-key (kbd "C-x B") 'ibuffer)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; Setup the backup directory (#<filename>#-files)
(setq backup-directory-alist '(("." . "~/.saves")))

;; Make <ret> always indent on newline
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Setting up python-for-emacs
(load-file ".emacs.d/emacs-for-python/epy-init.el")
