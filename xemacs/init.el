;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

(defvar running-on-windows (memq system-type '(windows-nt cygwin)))
(defvar running-on-linux (not running-on-windows))
(defvar running-on-x (eq window-system 'x))

;(add-to-list 'load-path "~/.xemacs/ruby-mode")
;(load-file "~/.xemacs/visual-basic-mode.el")
;(load-file "~/.xemacs/html-helper-mode.el")
;(load-file "~/.xemacs/hhm-config.el")
(load-file "~/.xemacs/xemacs-packages/actionscript-mode.el")
(load-file "~/.xemacs/xemacs-packages/as-config.el")


(defun perl-process-region (perl-code)
  "Send the contents of region to command, kill the region, and replace it with the output of process"
  (interactive "*sPerl Code: ")
  (let ((start (if (>= (point) (mark))
		   (point)
		 (mark)))
	(end (if (>= (point) (mark))
		 (mark)
	       (point))))
    (call-process-region start end "/usr/bin/perl" t t nil "-pe" perl-code)))
(global-set-key "\M-p" 'perl-process-region)

;(defun perl-process-html ( )
;  "Fixes up HTML for C++"
;  (interactive)
;  (perl-process-region "s/\\\\/\\\\\\\\/g; s/\"/\\\\\"/g; s/^(.+)/\"$1/; s/(.+)$/$1\"/"))
;(global-set-key "\C-xp" 'perl-process-html)

(set-default 'auto-mode-alist
             (append '(("\\.asp$" . visual-basic-mode)
                       ("\\.asa$" . visual-basic-mode)
                       ("\\.vbs?$" . visual-basic-mode)
                       ("\\.cf$" . apache-mode)
                       ("\\.conf$" . apache-mode)
                       ("httpd\\.conf" . apache-mode)
                       ("\\.as$" . actionscript-mode)
                       ("Makefile\\." . makefile-mode)
                       ("\\.php5$" . php-mode)
                       ("\\.mxml$" . xml-mode)
		       ("\\.as$" . actionscript-mode)
                       )
                     auto-mode-alist)
)

(setq minibuffer-max-depth nil)

(global-set-key [button3] 'popup-buffer-menu)

(defun php-process-region (php-code)
  "Send the contents of region to command, kill the region, and replace it with the output of process"
  (interactive "*sPhp Code: ")
  (let ((start (if (>= (point) (mark))
		   (point)
		 (mark)))
	(end (if (>= (point) (mark))
		 (mark)
	       (point))))
    (call-process-region start end "/usr/bin/php" t t nil "-r" (concat "$_ = file_get_contents('php://stdin'); " php-code))))
(global-set-key "\C-x\M-p" 'php-process-region)

(defun db-query-dump (query)
  "Dumps the contents of db query to the current buffer"
  (interactive "*sQuery: ")
  (call-process "/usr/bin/php" nil t t "-r" (concat "$query = '" query "'; mysql_connect( 'localhost:3306', 'root', '' );$result =  mysql_query( $query );$_ = '';$spacer = ' | ';if( $result !== false ){  $sp = '';    for( $i=0; $i<mysql_num_fields($result); $i++ )  {    $_ .= $sp . mysql_field_name($result, $i);    $sp = $spacer;  }  $_ .= \"\n\";  while( $r = mysql_fetch_row($result) )   $_ .= implode( $spacer, $r ) . \"\n\"; mysql_close(); print $_;} ")))
(global-set-key "\C-x\M-d" 'db-query-dump)

(global-unset-key "\C-z")
(global-set-key "\C-z" 'undo)


;(defun djy-indent-setup ()
;  (setq
;   c-label-minimum-indentation 0
;   )
;  (set
;   'c-offsets-alist (append '((substatement-open . 0) 
;                              (substatement . 4)
;                              (statement-block-intro . 4)
;                              (defun-block-intro . 4)
;                              (catch-clause . 0)
;                              )
;                            c-offsets-alist)
;  )
;)

;(add-hook 'php-mode-user-hook 'djy-indent-setup)
;(add-hook 'actionscript-mode-hook 'djy-indent-setup)

(defun php-sort ()
  "Sort a region of text"
  (interactive)
  (php-process-region "$a = explode(\"\\n\", $_); sort($a); print implode(\"\\n\", $a);"))

(progn
  (setq file (concat (getenv "HOME") "/.xemacs/" (getenv "USER") ".el"))
  (when (file-exists-p file)
    (load-file file)
  )
)

(defun ruby-process-region (ruby-code)
  "Send the contents of region to command, kill the region, and replace it with the output of process"
  (interactive "*sRuby Code: ")
  (let ((start (if (>= (point) (mark))
		   (point)
		 (mark)))
	(end (if (>= (point) (mark))
		 (mark)
	       (point))))
    (call-process-region start end "/usr/bin/ruby" t t nil "-e" (concat "$_ = STDIN.read; " ruby-code))))
(global-set-key "\M-r" 'ruby-process-region)


(global-set-key [(control backspace)] 'backward-kill-word)

(add-hook 'ruby-mode-hook
          '(lambda ()
             (define-key ruby-mode-map (kbd "M-BS") 'backward-kill-word)
))

(require 'mmm-mode)
(require 'mmm-auto)

(load "~/.xemacs/ruby-setup.el")
