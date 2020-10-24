(require 'graphql-mode)
(require 'mmm-mode)

(mmm-add-classes
 '((js-graphql
          :submode graphql-mode
          :face mmm-declaration-submode-face
          :front "[^a-zA-Z]gql`" ;; regex to find the opening tag
          :back "`"))) ;; regex to find the closing tag
(mmm-add-mode-ext-class 'js2-mode nil 'js-graphql)
(setq mmm-global-mode 'maybe)
;; Optional configuration that hides the background color for a highlighted block
;; I find it useful for debugging emacs, but when actually coding I dont want so much emphasis on submodes
(setq mmm-submode-decoration-level 0)
