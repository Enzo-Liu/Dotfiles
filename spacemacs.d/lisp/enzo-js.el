
(message "init enzo js...")
(add-hook 'js2-mode-hook (lambda ()
                      (setq-default
                       js2-strict-missing-semi-warning nil
                       js2-strict-trailing-comma-warning nil
                       js2-mode-show-strict-warnings nil
                       ;; js2-mode
                       js2-basic-offset 2
                       ;; web-mode
                       tab-width 2
                       css-indent-offset 2
                       web-mode-markup-indent-offset 2
                       web-mode-css-indent-offset 2
                       web-mode-code-indent-offset 2
                       web-mode-attr-indent-offset 2)))

(with-eval-after-load 'web-mode
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))
;;;###autoload
(defvar add-node-modules-path-debug nil
  "Enable verbose output when non nil.")

;;;###autoload
(defun add-node-modules-path ()
  "Search the current buffer's parent directories for `node_modules/.bin`.
If it's found, then add it to the `exec-path'."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (path (and root
                    (expand-file-name "node_modules/.bin/" root))))
    (if root
        (progn
          (make-local-variable 'exec-path)
          (add-to-list 'exec-path path)
          (when add-node-modules-path-debug
            (message (concat "added " path  " to exec-path"))))
      (when add-node-modules-path-debug
        (message (concat "node_modules not found in " root))))))

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook #'add-node-modules-path))

(provide 'enzo-js)
