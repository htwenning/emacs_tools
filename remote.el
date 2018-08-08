;; load this file on emacs init file.
;; add remote hosts name -> url
;; url format: /ssh:root@host#port:path
(setq remote-hosts '())
;; put remote hosts alist like follow:
;; (setq remote-hosts (append remote-hosts '((host . "/ssh:user@host#port:~"))))
(defun remote-find (host)
  "find file on remote host"
  (interactive "Shost: ")
  (find-file (alist-get host remote-hosts)))

(defun remote-shell (host)
  "open remote shell"
  (interactive "Shost: ")
  (let ((default-directory (alist-get host remote-hosts))
		(explicit-shell-file-name "/bin/bash")
		(host-name (symbol-name host)))
		(if (get-buffer host-name)
			(pop-to-buffer host-name)
		  (progn (pop-to-buffer (get-buffer-create (generate-new-buffer-name host-name)))
				 (shell (current-buffer))))))

(defun spawn-shell (p_buffer)
  "spawn local shell"
  (interactive "sname: ")
  (let ((buffer-name p_buffer))
	(progn (if (string-equal buffer-name "")
			 (setq buffer-name "shell"))
		   (if (get-buffer buffer-name)
			   (pop-to-buffer buffer-name)
			 (progn (pop-to-buffer (get-buffer-create (generate-new-buffer-name buffer-name)))
					(shell (current-buffer)))))))
