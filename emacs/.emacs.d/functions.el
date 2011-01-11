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

(defun db-query-dump (query)
  "Dumps the contents of db query to the current buffer"
  (interactive "*sQuery: ")
  (call-process "/usr/bin/php" nil t t "-r" (concat "$query = '" query "'; mysql_connect( 'localhost:3306', 'root', '' );$result =  mysql_query( $query );$_ = '';$spacer = ' | ';if( $result !== false ){  $sp = '';    for( $i=0; $i<mysql_num_fields($result); $i++ )  {    $_ .= $sp . mysql_field_name($result, $i);    $sp = $spacer;  }  $_ .= \"\n\";  while( $r = mysql_fetch_row($result) )   $_ .= implode( $spacer, $r ) . \"\n\"; mysql_close(); print $_;} ")))

(defun php-sort ()
  "Sort a region of text"
  (interactive)
  (php-process-region "$a = explode(\"\\n\", $_); sort($a); print implode(\"\\n\", $a);"))

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

