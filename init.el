
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;
;; (package-initialize)

(defconst emacs-start-time (current-time))

(unless noninteractive
  (message "Loading %s..." load-file-name))


;;; Cask ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (if (string-equal system-type "darwin")
      (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
    (require 'cask "~/.cask/cask.el"))
  (cask-initialize))

;;; Helpers ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun insert-divider (title)
  "Inserts a divider for breaking up code into paragraphs"
  (interactive "sTitle: ")
  (let ((pos (beginning-of-line))
        (line (format ";;; %s %s"
                      title
                      (make-string (- 80 (length (format ";;; %s " title))) ?\;))))
    (insert line)))

;;; Customizations ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(let ((settings
       (with-temp-buffer
         (insert-file-contents
          (expand-file-name "settings.el" user-emacs-directory))
         (goto-char (point-min))
         (read (current-buffer)))))
  (eval settings))

;; (add-hook 'after-init-hook (lambda ()
;; 														 (server-force-delete)
;; 														 (server-start t)))

(use-package no-littering)						

(use-package clojure-mode
  :config
  (load (expand-file-name "clojure-indentation.el" user-emacs-directory))

	(use-package cider
		:ensure t
		:config
		(require 'cider-eldoc)
		(add-hook 'cider-mode-hook #'cider-eldoc-setup)))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize))

(use-package gist
  :no-require t
  :bind (("C-c G" . gist-region-or-buffer)))

(use-package helm-config
  :bind (("C-c h" . helm-command-prefix)
         ("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini))

  :init
  (add-hook 'eshell-mode-hook
            (lambda ()
              (eshell-cmpl-initialize)
              (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
              (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)))

  :config
  (use-package helm
    :config
    (helm-autoresize-mode 1))

  (bind-key "<tab>" #'helm-execute-persistent-action helm-map)
  (bind-key "C-i" #'helm-execute-persistent-action helm-map)
  (bind-key "C-z" #'helm-select-action helm-map)
  (bind-key "A-v" #'helm-previous-page helm-map)

  (use-package helm-descbinds
    :bind ("C-h b" . helm-descbinds)
    :init
    (fset 'describe-bindings 'helm-descbinds)
    :config
    (require 'helm-config)))

(use-package isearch
  :bind (("C-M-r" . isearch-backward-other-window)
         ("C-M-s" . isearch-forward-other-window))
  :preface
  (defun isearch-backward-other-window ()
    (interactive)
    (split-window-vertically)
    (call-interactively 'isearch-backward))

  (defun isearch-forward-other-window ()
    (interactive)
    (split-window-vertically)
    (call-interactively 'isearch-forward))

  :config
  (bind-key "C-c" #'isearch-toggle-case-fold isearch-mode-map)
  (bind-key "C-t" #'isearch-toggle-regexp isearch-mode-map)
  (bind-key "C-^" #'isearch-edit-string isearch-mode-map)
  (bind-key "C-i" #'isearch-complete isearch-mode-map))

(use-package saveplace
  :init (setq save-place-file (expand-file-name ".places" user-emacs-directory))
  :config
  (save-place-mode 1))

;; (require 'helm-config)
;; (require 'better-defaults)
;; (require 'web-shortcuts)
;; (require 'git)
;; (require 'ruby)
;; (require 'clojure)

;; (progn
;;   (setq custom-file "~/.emacs.d/custom-file.el")
;;    (load custom-file))

;; (use-package exec-path-from-shell
;;   :config
;;   (exec-path-from-shell-initialize))

;; (use-package helm-mode
;;    :config
;;   (helm-mode 1)
;;   (global-set-key (kbd "C-x C-f") 'helm-find-files)

;;    (when (executable-find "ack")
;;      (setq helm-grep-default-command "ack -Hn --no-group --no-color %e %p %f"
;;            helm-grep-default-recurse-command "ack -H --no-group --no-color %e %p %f")))


;; ;; initialization
;; (server-force-delete)
;; (server-start t)
;; (eshell)

;; (global-set-key (kbd "C-M-u") 'backward-up-list)
