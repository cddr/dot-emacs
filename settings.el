(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
	 ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.emacs.d/.backups"))))
 '(cider-boot-parameters "cider repl -s -H :: wait")
 '(cider-pprint-fn (quote fipp))
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-file "~/.emacs.d/settings.el")
 '(delete-old-versions t)
 '(erc-hide-list (quote ("JOIN" "KICK" "NICK" "PART" "QUIT" "MODE")))
 '(erc-sound-mode t)
 '(eshell-visual-commands
	 (quote
		("vi" "screen" "top" "less" "more" "lynx" "ncftp" "pine" "tin" "trn" "elm")))
 '(ido-auto-merge-work-directories-length -1)
 '(ido-enable-flex-matching nil)
 '(js-indent-level 2)
 '(kept-new-versions 6)
 '(kept-old-versions 2)
 '(menu-bar-mode nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 5) ((control)))))
 '(ns-alternate-modifier (quote alt))
 '(ns-command-modifier (quote meta))
 '(nxml-sexp-element-flag t)
 '(package-selected-packages
	 (quote
		(jtags helm-dash helm-projectile projectile paredit helm-ag ag helm-git-grep exec-path-from-shell helm clojure-mode magit company solarized-theme better-defaults use-package cider)))
 '(safe-local-variable-values
	 (quote
		((cider-boot-parameters . "cider repl -s ...others... wait")
		 (cider-boot-parameters . "dev")
		 (cider-test-infer-test-ns . my-infer-test-ns)
		 (cider-test-infer-test-ns quote my-infer-test-ns)
		 (encoding . utf-8)
		 (encoding . us-ascii)
		 (add-log-time-format lambda nil
													(let*
															((time
																(current-time))
															 (system-time-locale "C")
															 (diff
																(+
																 (cadr time)
																 32400))
															 (lo
																(% diff 65536))
															 (hi
																(+
																 (car time)
																 (/ diff 65536))))
														(format-time-string "%a %b %e %H:%M:%S %Y"
																								(list hi lo)
																								t)))
		 (ruby-compilation-executable . "ruby")
		 (ruby-compilation-executable . "ruby1.8")
		 (ruby-compilation-executable . "ruby1.9")
		 (ruby-compilation-executable . "rbx")
		 (ruby-compilation-executable . "jruby"))))
 '(scroll-bar-mode nil)
 '(select-enable-clipboard t)
 '(select-enable-primary t)
 '(server-use-tcp t)
 '(tab-always-indent (quote complete))
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(tramp-syntax (quote default) nil (tramp))
 '(version-control t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
