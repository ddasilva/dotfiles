; Hello and -WELCOME- to MeltingWax's ~/.emacs!
; Email: <daniel@meltingwax.net>
; Please enjoy your stay, and don't fret.

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

; Hide scrollbar, toolbar, and menubar
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

; Custom Themes
(custom-set-variables
 '(custom-enabled-themes (quote (wombat))))
(custom-set-faces)
