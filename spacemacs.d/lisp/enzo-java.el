(require 'meghanada)
(add-hook 'java-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'delete-trailing-whitespace)))

(define-key evil-normal-state-map (kbd "C-]") (kbd "\\ M-."))
(define-key evil-normal-state-map (kbd "C-o") (kbd "\\ M-,"))

(provide 'enzo-java)
