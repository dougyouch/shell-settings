(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(set-face-foreground 'default "white")
(set-face-background 'default "black")

(load-file "~/.emacs.d/functions.el")
(load-file "~/.emacs.d/modes.el")

(defun my-c-mode-common-hook ()
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'defun-block-intro 2))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
