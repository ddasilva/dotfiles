; Hello and welcome to Daniel da Silva's .emacs.


(when (not (getenv "EMACS_NO_GIT"))
  (load "~/.emacs.d/git-modes/gitattributes-mode")
  (load "~/.emacs.d/git-modes/git-commit-mode")
  (load "~/.emacs.d/git-modes/gitconfig-mode")
  (load "~/.emacs.d/git-modes/gitignore-mode")
  (load "~/.emacs.d/git-modes/git-rebase-mode"))

(when (not (getenv "EMACS_NO_APPLE_KEYBOARD"))
  ;; Set keys for Apple keyboard, for emacs in OS X 
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier  'super)
  (setq mac-control-modifier 'control)
  (setq ns-function-modifier 'hyper))

; Enable syntax hilighting
(cond ((fboundp 'global-font-lock-mode)
       (global-font-lock-mode t)
       (setq font-lock-maximum-decoration t)))

; Move backups to somewhere else
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

; Hide scrollbar, toolbar, and menubar
(if (boundp 'scroll-bar-mode)
    (scroll-bar-mode 0))

(if (boundp 'tool-bar-mode)
    tool-bar-mode 0)

(menu-bar-mode 0)

; Column number mode always on
(setq column-number-mode t)

; Custom Themes
(custom-set-variables
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t))

(custom-set-faces)

; Defaults
(setq-default c-default-style "linux"
              c-basic-offset 4
              indent-tabs-mode nil)

(add-hook 'go-mode-hook
          (lambda ()
            ;(add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 0)))

; Special mode handlers
(setq auto-mode-alist
      (cons '("\\.make\\'" . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.svc\\'" . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.t\\'" . perl-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.js\\'" . rjsx-mode) auto-mode-alist))
  
; MELPA
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
