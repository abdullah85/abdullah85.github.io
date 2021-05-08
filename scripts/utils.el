
(defun commentCurrLine ()
  "comment current line at point"
  (interactive)
  (beginning-of-line)
  (re-search-forward
  (insert "<!--")  
  (end-of-line)
  (insert "-->")
  (beginning-of-line)
  (insert-char 9))

(defun unCommentCurrLine ()
  "Uncomment current line if it is a comment"
  (interactive)
  (beginning-of-line)
  (let ((startPoint (point)))
    (end-of-line)
    (let ((endPoint (point)))
      (unCommentWithinRange startPoint endPoint))))

(defun unCommentWithinRange (startPt endPt)
  "Un Comment within startPt endPt"
  (interactive)
  (if (re-search-backward "-->[[:space:]]*" startPt t)
      (let ((commentEndTag (point)))
	(beginning-of-line)
	(if (re-search-forward "[[:space:]]*<!--" endPt t)
	    (progn (kill-region commentEndTag endPt)
		   (kill-region startPt (point))
		   (beginning-of-line)
		   (insert-char 9))))
    nil))

