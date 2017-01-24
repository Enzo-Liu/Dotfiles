(require 'meghanada)
(add-hook 'java-mode-hook
          (lambda ()
            (meghanada-mode t)
            (gradle-mode t)
            (add-hook 'before-save-hook 'delete-trailing-whitespace)))

(add-hook 'groovy-mode-hook
          (lambda ()
            (gradle-mode t)))

(provide 'enzo-java)
