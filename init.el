;;; Commentary: ---  Well for now I write a switch which will be load the presets (curently live or prelude)
;;; by command line args. If no supplyed - loads vanilla Emacs.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-face-attribute 'default (selected-frame) :height 120)

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
		     ;; (load-file "~/.emacs.d/haskell-mode-setup.el")
		   )))

(add-to-list 'command-switch-alist
             (cons "--spacemacs"
                   (lambda (switch)
		     (add-to-list
		      'package-archives
		      '("melpa" . "http://melpa.org/packages/") t)
		     (setq user-emacs-directory "~/reps/spacemacs/")
                     (load-file "~/reps/spacemacs/init.el"))))

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
    (magit-popup crux which-key zop-to-char zenburn-theme yaml-mode web-mode volatile-highlights undo-tree swift-mode sublimity smex smartrep smartparens smart-mode-line scss-mode rainbow-mode rainbow-delimiters projectile ov operate-on-number neotree move-text markdown-mode+ magit json-mode js2-mode imenu-anywhere ido-ubiquitous hyde haskell-mode guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck flx-ido expand-region elm-mode elisp-slime-nav easy-kill discover-my-major diminish diff-hl company cider browse-kill-ring beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
