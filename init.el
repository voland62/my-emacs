;; Well for now I write a switch which will be load the presets (curently live or prelude)
;; by command line args. If no supplyed - loads vanilla Emacs.
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
(add-to-list 'load-path "~/reps/sublimity/")
(require 'sublimity)
(require 'sublimity-scroll)
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
		     ;; (load-file "~/.emacs.d/haskell-mode-setup.el")
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
