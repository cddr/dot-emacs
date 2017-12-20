
(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

(define-clojure-indent
  (form-to 'defun))

(define-clojure-indent
	(test-sequence 'defun)
	(gen/let 'defun)
	(checking 'defun)
	(test-event-sequence 'defun))
