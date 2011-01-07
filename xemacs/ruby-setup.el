;(tool-bar-mode 0)
;;----------------------------------------------------------------------------
;; Set up syntax highlighting (font-lock) 
;;----------------------------------------------------------------------------

(cond ((fboundp 'global-font-lock-mode)
       ;; Turn on font-lock in all modes that support it
       (global-font-lock-mode t)
       ;; Maximum colors
       (setq font-lock-maximum-decoration t)))


;(add-hook 'text-mode-hook                 
;          (function                       
;           (lambda ()           
;             (auto-fill-mode)
;             )))

;; Set up frame position and coloring
(setq default-frame-alist
      '(
        (background-color . "black")
	(foreground-color . "green")
        ))

;;;
;; css mode
(setq cssm-indent-function 'cssm-c-style-indenter)

;;;
;; ruby mode
(autoload 'ruby-mode "ruby-mode" "Load ruby-mode")
(add-hook 'ruby-mode-hook 'turn-on-font-lock)

;; associate ruby-mode with .rb files and .rjs files
(add-to-list 'auto-mode-alist '(".rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '(".rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '(".rake$" . ruby-mode))

(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
				     interpreter-mode-alist))

;; Ruby-Interpreter:
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (inf-ruby-keys)
	     ))


(require 'ruby-electric)
(require 'ruby-mode)

;;;
;; mmm mode for editing rhtml files
(require 'mmm-mode)
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(setq mmm-submode-decoration-level 2)
(set-face-background 'mmm-output-submode-face  "Black")
(set-face-background 'mmm-code-submode-face    "Black")
(set-face-background 'mmm-comment-submode-face "Black")
(set-face-foreground 'mmm-output-submode-face "Green")
(set-face-foreground 'mmm-code-submode-face "Green")
(set-face-foreground 'mmm-comment-submode-face "Red")
(mmm-add-classes
 '((erb-code
    :submode ruby-mode
    :match-face (("<%#" . mmm-comment-submode-face)
		 ("<%=" . mmm-output-submode-face)
		 ("<%"  . mmm-code-submode-face))
    :front "<%[#=]?"
    :back "-?%>"
    :insert ((?% erb-code       nil @ "<%"  @ " " _ " " @ "%>" @)
	     (?# erb-comment    nil @ "<%#" @ " " _ " " @ "%>" @)
	     (?= erb-expression nil @ "<%=" @ " " _ " " @ "%>" @))
    )))
(add-hook 'html-mode-hook
	  (lambda ()
	    (setq mmm-classes '(erb-code))
	    (mmm-mode-on)))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . html-mode))

;;;
 ;; yaml mode
 (autoload 'yaml-mode "yaml-mode" "YAML" t)
 (setq auto-mode-alist
       (append '(("\\.yml$" . yaml-mode)) auto-mode-alist))

;;;
 ;; rails mode
 (defun try-complete-abbrev (old)
   (if (expand-abbrev) t nil))

 (setq hippie-expand-try-functions-list
       '(try-complete-abbrev
	 try-complete-file-name
	 try-expand-dabbrev))

; (require 'rails)
; (setq rails-use-mongrel t)

 ;; make #! scripts executable after saving them
; (add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

