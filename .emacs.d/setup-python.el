;; Setup ipython as shell if it is available

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
      "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)

(eval-after-load "company"
 '(progn
   (add-to-list 'company-backends 'company-anaconda)))
