;; emacs packages
(when (fboundp 'package-initialize)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
													 ("melpa" . "http://melpa.milkbox.net/packages/")))
  (package-initialize))


(add-to-list 'load-path "~/.emacs.d")

(require 'better-defaults)
(require 'exec-path)
(require 'modeline)
(require 'git)
(require 'ruby)
(require 'clojure)

(setq js-indent-level 4)

(progn
  (setq custom-file "~/.emacs.d/custom-file.el")
  (load custom-file))

(setq jabber-account-list
      '(("achambers.home@gmail.com" . 
         (:password "ytmrndolztkdrdrk"
          :network-server "talk.google.com"
          :port 5223
          :connection-type "ssl"))))

(server-start)
