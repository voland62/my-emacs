;; specify path to the 'psc-ide' executable
(require 'psc-ide)

(add-hook 'purescript-mode-hook
          (lambda ()
            (psc-ide-mode)
            (company-mode)
            (flycheck-mode)
            (global-set-key (kbd "M-n") 'company-complete)
            (turn-on-purescript-unicode-input-method)
            (turn-on-purescript-indentation)))
