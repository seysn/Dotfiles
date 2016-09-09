;; Monokai theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)

;; Style code
;;(load "~/.emacs.d/style/google-c-style.el")
(global-linum-mode 1)
(set-default 'truncate-lines t)
;;(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; Backup saves
(setq backup-directory-alist
      `((".*" . , "~/.saves")))
(setq auto-save-file-name-transforms			
      `((".*" , "~/.saves" t)))
;; No more welcome screen
(setq inhibit-startup-message t)

;; Neotree
(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)
(setq neo-theme 'ascii)

;; Elpy packages
;;(package-initialize)
;;(elpy-enable)

;; Anzu
(add-to-list 'load-path "~/.emacs.d/elpa/anzu-0.22")
(require 'anzu)
(global-anzu-mode +1)

;;;
;;; Generated Options
;;;

;; Remove that toolbar
(tool-bar-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("2da65cb7074c176ca0a33f06bcc83ef692c9175e41b6370f5e94eb5811d6ee3a" default)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Tamzen" :foundry "Misc" :slant normal :weight normal :height 120 :width normal)))))
