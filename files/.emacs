; Hello and -WELCOME- to MeltingWax's ~/.emacs!
; Email: <daniel@meltingwax.net>
; Please enjoy your stay, and don't fret.

(add-to-list 'load-path "~/.emacs.d/")

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

; Hide scrollbar, toolbar, and menubar
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

; Custom Themes
(custom-set-variables
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t))
(custom-set-faces)

; Defaults
(setq-default c-default-style "linux"
              c-basic-offset 4
              indent-tabs-mode nil)
