(let ((my-local-bin-path (expand-file-name "~/.local/bin")))
  (setenv "PATH" (concat my-local-bin-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-local-bin-path))
