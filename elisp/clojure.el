

(add-to-list 'load-path "~/.emacs.d/vendor/cider")
(require 'cider)
(require 'clojure-mode)

(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2)
  (test-input 'defun)

  ;; test.check
  (for-all 'defun)

  ;; riemann dsl
  (by 'defun)
  (moving-time-window 'defun)
  (changed-state 'defun)
  (stable 'defun)
  (where 'defun)
  (run-stream))

(define-clojure-indent
  (form-to 'defun))

(define-clojure-indent
  (for-all 'defun))

(define-clojure-indent
  (context 'defun)
  (it 'defun))


;; Test navigation:
(defun specl-test-p ()
  (or (string-match-p "spec\." (clojure-find-ns))
      (string-match-p "/spec" (buffer-file-name))))

(defun my-infer-test-ns (ns)
  "Returns the path of the test file for the given namespace."
  (when ns
    (let ((suffix "-spec"))
      (if (string-match-p (rx-to-string `(: ,suffix eos) t) ns)
          ns
        (concat ns suffix)))))

(add-hook 'cider-mode-hook #'eldoc-mode)

(provide 'clojure)
