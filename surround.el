(defun insert-at (position char)
  "insert char at given position"
  (progn (goto-char position)
		 (insert char)))
(defun surround-with (begin end char)
  "surround region with pair of chars"
  (interactive "r\nschar: ")
  (let ((end_char char))
	(progn (cond ((string= char "(") (setq end_char ")"))
				 ((string= char "[" ) (setq end_char "]"))
				 ((string= char "{") (setq end_char "}"))
				 (t '()))
	 (save-excursion
	   (insert-at end end_char)
	   (insert-at begin char)))))


(defun surround-delete (char)
  "delete surround"
  (interactive "schar: ")
  (let ((end_char char) (position (point)))
	(progn (cond ((string= char "(") (setq end_char ")"))
				 ('t '()))
		   (search-forward end_char)
		   (goto-char (- (point) 1))
		   (delete-char 1)
		   (goto-char position)
		   (search-backward char)
		   (delete-char 1))))

