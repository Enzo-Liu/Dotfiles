(require 'meghanada)
(add-hook 'java-mode-hook
          (lambda ()
            (meghanada-mode t)
            (gradle-mode t)
            (add-hook 'before-save-hook 'delete-trailing-whitespace)))

(add-hook 'groovy-mode-hook
          (lambda ()
            (gradle-mode t)))

(defun my-jump-to-tag ()
  (interactive)
  (evil-execute-in-emacs-state)
  (call-interactively (key-binding (kbd "M-."))))
(define-key evil-normal-state-map (kbd "C-]") 'my-jump-to-tag)

(defun my-jump-back ()
  (interactive)
  (evil-execute-in-emacs-state)
  (call-interactively (key-binding (kbd "M-,"))))
(define-key evil-normal-state-map (kbd "C-o") 'my-jump-back)

(provide 'enzo-java)
