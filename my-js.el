(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)

  ;;(flycheck-add-mode 'javascript-eslint 'web-mode)
  ;;(flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
  ;;(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)


  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  (company-mode +1))



(add-to-list 'auto-mode-alist '("/.*\\.js\\'" . rjsx-mode))

(add-hook 'rjsx-mode-hook #'setup-tide-mode)
;;(add-hook 'js2-mode-hook #'setup-tide-mode)



;; --------------------------------------------------------
;; This setup from the github readme.md, but
;; emacs complaines that 'javascript-tide and 'jsx-tide
;; are not valid checkers....



;; (require 'web-mode)

;; (use-package tide
;;              :ensure t
;;              :after (typescript-mode company flycheck)
;;              :hook ((typescript-mode . tide-setup)
;;                     (typescript-mode . tide-hl-identifier-mode)
;;                     (before-save . tide-format-before-save)))




;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (string-equal "jsx" (file-name-extension buffer-file-name))
;;               (setup-tide-mode))))
;; ;; configure jsx-tide checker to run after your default jsx checker
;; (flycheck-add-mode 'javascript-eslint 'web-mode)
;; (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)





;; (add-hook 'js2-mode-hook #'setup-tide-mode)
;; ;; configure javascript-tide checker to run after your default javascript checker
;; (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
