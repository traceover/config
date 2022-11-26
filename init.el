(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(load (expand-file-name "rc.el" user-emacs-directory))

;;; Multiple cursors
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(menu-bar-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq-default indent-tabs-mode nil)

(require 'ido-completing-read+)
(ido-mode 1)
(ido-everywhere 1)

;;; c-mode
(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))

(add-hook 'c-mode-hook (lambda ()
                         (interactive)
                         (c-toggle-comment-style -1)))

;;; display-line-numbers-mode
(global-display-line-numbers-mode 1)

(add-to-list 'custom-theme-load-path
             "~/.emacs.d/gruber-dark-theme.el")

(add-to-list 'load-path "~/.emacs.local/")
(require 'ax-mode)
(require 'mcf-mode)
(require 'jai-mode)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(add-to-list 'auto-mode-alist '("\\.nasm\\'" . nasm-mode))

;; (require 'simpc-mode)
;; (add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;;; pressing C-z suspends the frame
(global-unset-key (kbd "C-z"))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
