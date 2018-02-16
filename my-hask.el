;;; Commentary
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(custom-set-variables
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t))

(custom-set-variables
 '(haskell-process-type 'stack-ghci))

(setq haskell-compile-cabal-build-command "stack build")

(custom-set-variables
 '(haskell-tags-on-save t))

(define-key haskell-mode-map (kbd "M-.") 'haskell-mode-jump-to-def-or-tag)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
