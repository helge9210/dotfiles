(package-initialize)

(load "~/.emacs.d/functions.el")

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(setq gnutls-min-prime-bits 1024)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(load-init
 "melpa"
 "theme"
 "c-mode"
 "git"
 "tramp"
 "el-get")

(elpy-enable)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote ((".*" . "~/backup_files"))))
 '(bidi-paragraph-direction nil)
 '(js-indent-level 2)
 '(mouse-yank-at-point t)
 '(package-selected-packages
   (quote
    (py-autopep8 skewer-mode iedit magit haskell-mode fill-column-indicator elpy csv-mode)))
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
