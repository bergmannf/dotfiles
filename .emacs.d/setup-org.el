(require 'ox-reveal)

(require 'htmlize)

(defun add-pcomplete-capf ()
  (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))

(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'add-pcomplete-capf)

(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(global-set-key (kbd "C-c c") 'org-capture)

(global-set-key (kbd "C-c o")
                (lambda () (interactive)
                  (find-file "~/Documents/org/organizer.org")))

(setq org-default-notes-file "~/Documents/org/organizer.org")
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))
