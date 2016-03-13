;; Monokai theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai)

;; Style code
(load "~/.emacs.d/style/google-c-style.el")
(global-linum-mode 1)
(set-default 'truncate-lines t)
(setq c-basic-offset 4)

;; Backup saves
(setq backup-directory-alist
      `((".*" . , "~/.saves")))
(setq auto-save-file-name-transforms			
      `((".*" , "~/.saves" t)))
      
;; Remove that toolbar
(tool-bar-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("2da65cb7074c176ca0a33f06bcc83ef692c9175e41b6370f5e94eb5811d6ee3a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
