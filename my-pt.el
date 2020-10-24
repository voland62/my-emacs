(elpy-enable)

;; предполагаем что мы всегда работаем в ve
(setq python-shell-interpreter "python";;"ipython" ;;"python3.6"
      python-shell-interpreter-args "-i")


;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")
