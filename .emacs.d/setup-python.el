(defun set-default-interpreter-ipython ()
  (cond ((executable-find "ipython") (setq ipython "ipython"))
        ((executable-find "ipython3") (setq ipython "ipython3"))
        (:else (setq ipython "python")))
  (if (string-match-p "ipy\.*" ipython)
      (setq python-shell-interpreter ipython
            python-shell-interpreter-args ""
            python-shell-prompt-regexp "In \\[[0-9]+\\]: "
            python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
            python-shell-completion-setup-code
            "from IPython.core.completerlib import module_completion"
            python-shell-completion-module-string-code
            "';'.join(module_completion('''%s'''))\n"
            python-shell-completion-string-code
            "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")))


(add-to-list 'evil-emacs-state-modes 'anaconda-nav-mode)
(add-to-list 'evil-emacs-state-modes 'anaconda-mode-view-mode)

(add-hook 'python-mode-hook 'anaconda-mode)
;; Use python-imenu-create-index to create the imenu index.
;; Semantic will not work.
(add-hook 'python-mode-hook
          (function (lambda ()
            (setq imenu-create-index-function 'python-imenu-create-index))))
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'venv-postactivate-hook 'set-default-interpreter-ipython)

(add-hook 'python-mode-hook 'eldoc-mode)
