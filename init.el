(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(defvar dot-emacs "~/dot-emacs")

;; standard packages
;; (when (fboundp 'package-initialize)
;;   (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;   			   ("melpa" . "http://melpa.milkbox.net/packages/")))
;;     (package-initialize)
;;     (dolist (p '(better-defaults solarized-theme company
;;                  magit
;;                  clojure-mode
;;                  helm))
;;      (package-install p)))

;; ;; ;; ;; local customization
(add-to-list 'load-path (concat dot-emacs "/elisp"))
(add-hook 'after-init-hook 'global-company-mode)

(require 'helm-config)
(require 'better-defaults)
(require 'web-shortcuts)
(require 'git)
(require 'ruby)
(require 'clojure)

(progn
  (setq custom-file (concat dot-emacs "/custom-file.el")
   (load custom-file)))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package helm-mode
   :config
  (helm-mode 1)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)

   (when (executable-find "ack")
     (setq helm-grep-default-command "ack -Hn --no-group --no-color %e %p %f"
           helm-grep-default-recurse-command "ack -H --no-group --no-color %e %p %f")))


;; ;; initialization
(server-force-delete)
(server-start t)
(eshell)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

 (defun search-keybind (regexp &optional nlines)
   (interactive (occur-read-primary-args))
   (save-excursion
     (describe-bindings)
     (set-buffer "*Help*")
     (occur regexp nlines)
     (delete-windows-on "*Help*")))

(global-set-key (kbd "C-M-u") 'backward-up-list)
