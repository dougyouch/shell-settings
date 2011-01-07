(custom-set-variables
 '(bar-cursor nil)
 '(column-number-mode t)
 '(cperl-brace-imaginary-offset -2)
 '(cperl-brace-offset -2)
 '(cperl-indent-region-fix-constructs nil)
 '(cperl-merge-trailing-else nil)
 '(cssm-mirror-mode nil)
 '(font-lock-mode nil nil (font-lock))
 '(font-lock-use-colors t)
 '(font-lock-use-fonts nil)
 '(html-helper-mode-global-JSP-not-ASP nil nil (html-helper-mode))
 '(html-helper-mode-uses-visual-basic t nil (html-helper-mode))
 '(htmlize-html-major-mode (quote html-mode))
 '(line-number-mode t)
 '(mouse-yank-at-point t)
 '(paren-bind-modified-sexp-functions nil)
 '(paren-mode (quote sexp) nil (paren))
 '(query-user-mail-address nil)
 '(require-final-newline t)
 '(toolbar-captioned-p nil)
 '(toolbar-visible-p nil)
 '(user-mail-address "noone@here.com"))
(custom-set-faces
 '(custom-modified-face ((((class color)) (:foreground "white"))))
 '(font-lock-comment-face ((((class color) (background light)) (:foreground "magenta"))))
 '(font-lock-doc-string-face ((((class color) (background light)) (:foreground "magenta"))))
 '(font-lock-function-name-face ((((class color) (background light)) (:foreground "red"))))
 '(font-lock-preprocessor-face ((((class color) (background light)) (:foreground "red"))))
 '(font-lock-string-face ((((class color) (background light)) (:foreground "magenta"))))
 '(font-lock-type-face ((((class color) (background light)) (:foreground "lightblue"))))
 '(font-lock-variable-name-face ((((class color) (background light)) (:foreground "yellow"))))
 '(paren-face-match ((t (:foreground "default" :background "black" :bold t))))
 '(paren-match ((t (:foreground "default" :background "black" :bold t))) t)
 '(paren-mismatch ((t (:foreground "default" :background "black" :bold t))) t)
 '(zmacs-region ((t (:foreground "default" :background "black" :bold t))) t))

(set-face-foreground 'default "white")
(set-face-background 'default "black")

;; Turn off use of tabs for indentation in many modes
(setq indent-tabs-mode nil)


;; LaTeX mode
(add-hook 'latex-mode-hook '(lambda()
                              (setq indent-tabs-mode nil)
                              )
	  )

;; C mode
(add-hook 'c-mode-hook '(lambda()
                          (setq indent-tabs-mode nil)
                          )
	  )

;; C++ mode
(add-hook 'c++-mode-hook '(lambda()
                            (setq indent-tabs-mode nil)
                            )
	  )

;; Ruby mode
(add-hook 'ruby-mode-hook '(lambda()
                            (setq indent-tabs-mode nil)
                            )
	  )

;; Javascript mode
(add-hook 'javascript-mode-hook '(lambda()
                          (setq indent-tabs-mode nil)
                          )
	  )

;; Fortran mode
(add-hook 'fortran-mode-hook '(lambda()
				(setq indent-tabs-mode nil)
				)
	  )

;; perl mode
(add-hook 'perl-mode-hook '(lambda()
                             (setq indent-tabs-mode nil)
                             )
	  )

;; Lisp mode
(add-hook 'lisp-mode-hook '(lambda()
                             (setq indent-tabs-mode nil)
                             )
	  )

            ;;  (set-background-color "Black")
            ;;  (set-foreground-color "snow")
            ;;  (set-mouse-color "orchid")
            ;;  (set-cursor-color "orchid")
            ;;  (set-face-background 'region "darkred")
            ;;  (set-face-foreground 'region "white")
            ;;  (setq w3-node-style 'font-lock-keyword-face)
            ;;  (setq w3-address-style 'font-lock-comment-face)
            ;;  (setq w3-bold-style 'font-lock-keyword-face)
            ;;  (setq w3-italic-style 'font-lock-comment-face)

