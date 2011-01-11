(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))

(autoload 'haml-mode "haml-mode.el"
  "Major mode for editing HAML files" t)
(setq auto-mode-alist
      (cons '("\\.haml" . haml-mode) auto-mode-alist))

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/rails-minor-mode"))
(require 'rails)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/rhtml-minor-mode"))
(require 'rhtml-mode)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/yaml-mode"))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))


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

;; Haml mode
(add-hook 'haml-mode-hook '(lambda()
                             (setq indent-tabs-mode nil)
                             )
	  )
