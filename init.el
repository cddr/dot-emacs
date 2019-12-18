;;; Package Initialization ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

(setq
 package-enable-at-startup nil

 package-archives '(("org"       . "http://orgmode.org/elpa/")
                    ("gnu"       . "http://elpa.gnu.org/packages/")
                    ("melpa"     . "https://melpa.org/packages/")
                    ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package) ; guess what this one does too ?

;;; Customizations ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(let ((settings
       (with-temp-buffer
         (insert-file-contents
          (expand-file-name "settings.el" user-emacs-directory))
         (goto-char (point-min))
         (read (current-buffer)))))
  (eval settings))

(use-package eshell :ensure t
	:config (load-file "~/.emacs.d/eshell-functions.el"))


(use-package exec-path-from-shell :ensure t
	:config
	(setq exec-path-from-shell-variables
				`("PATH" "MANPATH" "ARTIFACTORY_USER" "ARTIFACTORY_PASSWORD"))
	:init
	(when (memq window-system '(mac ns x))
		(exec-path-from-shell-initialize)))

(use-package no-littering :ensure t)

(use-package clojure-mode :ensure t
  :config
  (load (expand-file-name "clojure-indentation.el" user-emacs-directory)))

(use-package cider :ensure t
	:config
	(require 'cider-eldoc)
	(add-hook 'cider-mode-hook #'cider-eldoc-setup))

(use-package exec-path-from-shell :ensure t
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize))

(use-package gist :ensure t
  :no-require t
  :bind (("C-c G" . gist-region-or-buffer)))

(use-package direnv :ensure t
	:config
	(direnv-mode))

(use-package saveplace
  :init (setq save-place-file (expand-file-name ".places" user-emacs-directory))
  :config
  (save-place-mode 1))

(use-package ivy-hydra :ensure t)

(use-package ivy :ensure t
	:init (ivy-mode 1)
	:config
	(setq ivy-use-virtual-buffers t
				ivy-count-format "(%d/%d) ")

	(global-set-key (kbd "C-s") 'swiper)
	(global-set-key (kbd "M-x") 'counsel-M-x)
	(global-set-key (kbd "C-x C-f") 'counsel-find-file)
	(global-set-key (kbd "C-c g") 'counsel-git)
	(global-set-key (kbd "C-c j") 'counsel-git-grep)
	(global-set-key (kbd "C-c k") 'counsel-ag)
	(global-set-key (kbd "<f1> f") 'counsel-describe-function)
	(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
	(global-set-key (kbd "<f1> l") 'counsel-find-library)
	(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
	(global-set-key (kbd "<f2> u") 'counsel-unicode-char))	

(defun unfill-region (beg end)
  "Unfill the region, joining text paragraphs into a single
    logical line.  This is useful, e.g., for use with
    `visual-line-mode'."
  (interactive "*r")
  (let ((fill-column (point-max)))
    (fill-region beg end)))

(exec-path-from-shell-copy-env "AWS_SESSION_TOKEN")
(exec-path-from-shell-copy-env "AWS_SECRET_ACCESS_KEY")
(exec-path-from-shell-copy-env "AWS_ACCESS_KEY_ID")
(exec-path-from-shell-copy-env "AWS_REGION")

(server-start)

