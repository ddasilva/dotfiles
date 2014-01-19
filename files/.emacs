; Hello and -WELCOME- to MeltingWax's ~/.emacs!
; Email: <daniel@meltingwax.net>
; Please enjoy your stay, and don't fret.

; Java Indentation
; http://www.emacswiki.org/emacs/IndentingJava
(add-hook 'java-mode-hook
	  (lambda ()
	    "Treat Java 1.5 @-style annotations as comments."
	    (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
	    (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

(add-hook 'java-mode-hook (lambda () (setq c-basic-offset 4)))

; Indent whole buffer
; Source: http://emacsblog.org/2007/01/17/indent-whole-buffer/
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

; Rebind C-x C-b to electric-buffer-list
(global-set-key "\C-x\C-b" 'electric-buffer-list)

; Conditional package installs if package.el is installed
(when (require 'package nil 'noerror)
  ; initialize
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize)

  ; clojure-mode
  (unless (package-installed-p 'clojure-mode)
    (package-refresh-contents)
    (package-install 'clojure-mode))

  ; org-mode
  (unless (package-installed-p 'org)
    (package-refresh-contents)
    (package-install 'org)))
