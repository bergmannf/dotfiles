(require 'ox-reveal)

(require 'htmlize)

(defvar til-base "~/Documents/til")

(defun add-pcomplete-capf ()
  (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))

(setq org-agenda-files
      (delq nil
            (mapcar (lambda (x) (and (file-exists-p x) x))
                    '("~/Dropbox/notes/overview.org"
                      "~/Dropbox/notes/junggesellenabschied/overview.org"
                      "~/Dropbox/notes/rpg/overview.org"
                      "~/Dropbox/notes/haskell/overview.org"
                      "~/Dropbox/notes/scala/overview.org"))))

(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'add-pcomplete-capf)

(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(global-set-key (kbd "C-c c") 'org-capture)

(global-set-key (kbd "C-c o") 
                (lambda () (interactive) (find-file "~/Dropbox/notes/overview.org")))

(setq org-default-notes-file "~/Dropbox/notes/overview.org")

(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))

(defun get-til-file ()
  (let ((category (read-string "Category: "))
        (topic (read-string "Topic: ")))
    (expand-file-name (format "~/Documents/til/%s/%s.org" category topic))))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/organizer.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("l" "TIL entry" entry (file (get-til-file))
         "* %?\nEntered on %U\n  %i\n  %a")))
