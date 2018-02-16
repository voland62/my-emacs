;;; Commentary: ---  Well for now I write a switch which will be load the presets (curently live or prelude)
;;; by command line args. If no supplyed - loads vanilla Emacs.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-face-attribute 'default (selected-frame) :height 100)

(global-set-key [(control tab)] 'other-window)

;;--- utils ------------------------------------------
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))

(global-set-key (kbd "C-c I") 'find-user-init-file)

;; --- smoth scrolling -------------------
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;;(add-to-list 'load-path "~/reps/sublimity/")
;;(require 'sublimity)
;;(require 'sublimity-scroll)
;; (require 'sublimity-map)
;; (require 'sublimity-attractive)

;; --- auto save off ---------------------
(setq prelude-theme 'deeper-blue)
(setq prelude-auto-save nil)


;; --- parse my command line args --------
(add-to-list 'command-switch-alist
             (cons "--prelude"
                   (lambda (switch)
                     (load-file "~/reps/prelude/init.el")
                     (global-set-key [f8] 'neotree-toggle)
		     (load-file "~/reps/my-emacs/my-hask.el")
                     (load-file "~/reps/my-emacs/my-ps.el")
		   )))

(add-to-list 'command-switch-alist
             (cons "--intero"
                   (lambda (switch)
		     (load-file "~/reps/intero/elisp/intero.el")
		     (add-hook 'haskell-mode-hook 'intero-mode)
		     )))



(add-to-list 'command-switch-alist
             (cons "--ohai"
                   (lambda (switch)
                     (load-file "~/reps/ohai-emacs/init.el")
		   )))

(add-to-list 'command-switch-alist
             (cons "--spacemacs"
                   (lambda (switch)
		     ;; (setenv "HOME" (concat (getenv "HOME") "/reps/spacemacs"))
                     ;; (load-file ".emacs.d/init.el")
		     )))

(add-to-list 'command-switch-alist
             (cons "--haskell"
                   (lambda (switch)
                    ;; (add-to-list 'load-path "~/reps/haskell-mode/")
		    ;; (load "haskell-mode-autoloads.el")
			;castomizatione
		     ;;(load-file "~/.emacs.d/haskell-mode-setup.el")
		     (load-file "~/.emacs.d/haskell-setup-v1.el")
		     )))


(add-to-list 'command-switch-alist
             (cons "--live"
                   (lambda (switch)
                     (setenv "EMACS_LIVE_DIR" "~/reps/emacs-live/")
                     (load-file "~/reps/emacs-live/init.el")
		     )))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (scss-mode yaml-mode web-mode json-mode js2-mode haskell-mode rainbow-mode elisp-slime-nav cider clojure-mode rainbow-delimiters company smex ido-ubiquitous flx-ido zop-to-char zenburn-theme which-key volatile-highlights undo-tree smartrep smart-mode-line operate-on-number move-text magit projectile ov imenu-anywhere guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major dash crux browse-kill-ring beacon anzu ace-window smooth-scrolling smartparens neotree ada-mode)))
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
