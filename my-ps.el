;;; my-purescript-setup --- subj
;;; Commentary:
;;; specify path to the 'psc-ide' executable
(require 'psc-ide)

;;; Code:
;;(add-to-list 'load-path (expand-file-name "~/reps/new-purescript-mode/"))
;;(require 'purescript-mode)



;;; Code:
(add-hook 'purescript-mode-hook
          (lambda ()
            (psc-ide-mode)
            (company-mode)
            (flycheck-mode)
            ;;(setq flycheck-check-syntax-automatically '(mode-enabled save))
            (global-set-key (kbd "M-n") 'company-complete)
            (turn-on-purescript-unicode-input-method)
            (turn-on-purescript-indentation)
	    ))

(provide 'my-ps)
;;; my-ps.el ends here
