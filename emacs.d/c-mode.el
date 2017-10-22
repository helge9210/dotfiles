(require 'indent-guide)
(indent-guide-global-mode)
(setq indent-guide-recursive nil)

(eval-after-load "cc-mode"
  '(progn
     (define-key c-mode-base-map (kbd "C-c M-c") 'compile)
     ))


(defun helge/c-mode-hook ()
;;   (c-set-offset 'substatement-open 0)
;;   (c-set-offset 'case-label '+)
  ;;   (setq indent-tabs-mode nil))
  (fci-mode 1))
  

(add-hook 'c-mode-common-hook 'helge/c-mode-hook)
