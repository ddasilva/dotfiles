
; Hello and -WELCOME- to MeltingWax's ~/.emacs!
; Email: <daniel@meltingwax.net>
; Please enjoy your stay, and don't fret.

(add-to-list 'load-path "~/.emacs.d/")

(when (not (getenv "EMACS_NO_GIT"))
  (load "~/.emacs.d/git-modes/gitattributes-mode")
  (load "~/.emacs.d/git-modes/git-commit-mode")
  (load "~/.emacs.d/git-modes/gitconfig-mode")
  (load "~/.emacs.d/git-modes/gitignore-mode")
  (load "~/.emacs.d/git-modes/git-rebase-mode"))

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
(if (boundp 'scroll-bar-mode)
    (scroll-bar-mode 0))

(if (boundp 'tool-bar-mode)
    tool-bar-mode 0)

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

; Special mode handlers
(setq auto-mode-alist
      (cons '("\\.make\\'" . makefile-mode) auto-mode-alist))

(setq auto-mode-alist
      (cons '("\\.t\\'" . perl-mode) auto-mode-alist))

; Emacs 24 Package System
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

