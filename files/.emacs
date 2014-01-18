; Hello and -WELCOME- to MeltingWax's ~/.emacs!
; Email: <daniel@meltingwax.net>
; Please enjoy your stay, and don't fret.

; http://www.emacswiki.org/emacs/IndentingJava
(add-hook 'java-mode-hook
	  (lambda ()
	    "Treat Java 1.5 @-style annotations as comments."
	    (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
	    (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

(add-hook 'java-mode-hook (lambda ()
			    (setq c-basic-offset 4)))

; http://emacsblog.org/2007/01/17/indent-whole-buffer/
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

; Enable syntax hilighting
(cond ((fboundp 'global-font-lock-mode)
       ;; Turn on font-lock in all modes that support it
       (global-font-lock-mode t)
       ;; Maximum colors
       (setq font-lock-maximum-decoration t)))


; Move backups to somewhere else
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

; Conditional package installs if package.el is installed
(when (require 'package nil 'noerror)g
  ; clojure-mode
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize)
  (unless (package-installed-p 'clojure-mode)
    (package-refresh-contents)
    (package-install 'clojure-mode)))
