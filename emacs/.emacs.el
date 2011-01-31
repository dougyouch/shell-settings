(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(initial-buffer-choice t)
 '(ruby-electric-expand-delimiters-list nil)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(tabbar-mode t)
(tool-bar-mode 0)
(set-face-foreground 'default "white")
(set-face-background 'default "black")

(load-file "~/.emacs.d/functions.el")
(load-file "~/.emacs.d/modes.el")
(load-file "~/.emacs.d/macros.el")

(defun my-c-mode-common-hook ()
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'defun-block-intro 2))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(setq mouse-yank-at-point t)
