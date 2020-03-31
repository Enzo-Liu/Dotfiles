;;;###auto-load
(defun enzo/run ()
  "Use this to run single file in different file type."
  (interactive)
  (let* ((otherCmdMap `(("cpp" . "&& ./a.out")))
         (suffixMap `(("py" . "python") ("rb" . "ruby") ("js" . "node") ("cpp" . "g++")
                      ("sh" . "bash") ("ml" . "ocaml") ("vbs" . "cscript") ("c" . "c")
                      ("hs" . "stack --install-ghc runghc") ("c++" . "c")))
         (fName (buffer-file-name))
         (fSuffix (file-name-extension fName))
         (progName (cdr (assoc fSuffix suffixMap)))
         (otherCmd (cdr (assoc fSuffix otherCmdMap)))
         (cmdStr (concat progName " \""   fName "\" " otherCmd)))
    (when (buffer-modified-p)
      (when (y-or-n-p "Buffer modified.  Do you want to save first? ")
        (save-buffer)))
    (if progName
        (progn
          (message "Running…")
          (shell-command cmdStr))
      (message "No recognized program file suffix for this file."))))

(setq *is-a-mac* (eq  system-type 'darwin))

(defun get-usaco-path ()
  "Get home path for usaco.  Consider in mac or linux."
  (let* ((prefix `((t . "~") (nil . "~")))
         (path (concat (cdr (assoc *is-a-mac* prefix)) "/work/usacontext/" )))
    path))

(defun get-folder-last-modify-date (folder)
  "Return the FOLDER last modify date."
  (substring
   (shell-command-to-string (format "ls -ld %s | awk -F' '  '{ print $6 \" \"$7 }'" folder))
   0 -1))

(defun usaco-format (folder name type)
  "Given FOLDER, NAME, &KEY TYPE, return ((NAME . NAME) (TYPE . TYPE) (FOLDER . FOLDER))."
  (cons (concat name "-" (symbol-name type))
        `(("name" . ,name)
          ("folder" . ,folder)
          ("type" . ,type))))

(defun string/start-with (s begins)
  "Return non-nil if string S start with BEGINS."
  (cond ((>= (length s) (length begins))
         (string-equal (substring s 0 (length begins)) begins))
        (_ nil)))

(defun list-sub-directory (path)
  "List all the directory below PATH.  Just the first level."
  (let ((res '()))
    (dolist (f (directory-files path))
      (let ((name (concat path "/" f)))
        (when (and (file-directory-p name)
                   (not (string/start-with f ".")))
          (setf res (push f res)))))
    res))

(defun get-done-project (path)
  "Get all done project by path.  The done project list in $PATH/done/."
  (let ((done-path (concat path "done/")))
    (mapcar #'(lambda (name) (usaco-format (concat done-path name) name :DONE))
            (list-sub-directory done-path))))

(defun get-unfinished-project (path)
  "Get all unfinished project by path.  The done project list in $PATH/done/."
  (let ((done-path path))
    (mapcar #'(lambda (name) (usaco-format (concat done-path name) name :TODO))
            (cl-remove-if #'(lambda (name) (equal name "done")) (list-sub-directory done-path)))))

(defun usaco-lookup ()
  "Search for exsiting usaco programs and leave an add option."
  (let ((path (get-usaco-path)))
    (append
     (list (usaco-format path "undefined" :CREATE))
     (get-unfinished-project path)
     (get-done-project path))))

(defun actions-for-usaco (actions program)
  "Return ACTIONS for selecting a PROGRAM."
  (let ((type (cdr (assoc "type" program))))
    (cond ((equal type :CREATE)
           `(("CREATE" . uco-create)))
          ((equal type :TODO)
           `(("OPEN" . uco-display)
             ("MARK-DONE" . uco-done)
             ("REMOVE" . uco-remove)))
          (_ `(("OPEN" . uco-display)
               ("MARK-UNDONE" . uco-undone))))))

(defvar uco-helm-source-search
  '((name . "USACO")
    (candidates-process . usaco-lookup)
    (action-transformer . actions-for-usaco)))

;;;###auto-load
(defun enzo/uco ()
  "Use this to init the ${NAME} programming for usacontext."
  (interactive)
  (helm :sources '(uco-helm-source-search)
        :buffer "*usaco-search*"
        :candidate-number-limit 20))

(defun uco-create (name)
  "Create program in usaco for the input NAME."
  (interactive "s please input the program name you want to create: ")
  (let* ((sedcmd `((t . "sed -i '' ") (nil . "sed -i ")))
         (path (get-usaco-path))
         (folder (concat path name "/")))
    (unless (file-exists-p folder)
      (make-directory folder)
      (shell-command (concat  "cp " path  "sample/sample.cpp " folder name ".cpp && "
                              (cdr (assoc *is-a-mac* sedcmd)) "'s/#{name}/" name "/' " folder "*.cpp" )))
    (uco-display `(("folder" . ,folder) ("name" . ,name)))))

(defun uco-undone (program)
  "Mark this PROGRAM to be undone."
  (let* ((folder (cdr (assoc "folder" program)))
         (dest (concat folder "/../../"))
         (cmd (concat "mv " folder " " dest)))
    (shell-command cmd)
    (uco-clean program)))

(defun slient-kill-buffers (regexp)
  "Kill buffers matching REGEXP without asking for confirmation."
  (interactive "sKill buffers matching this regular expression: ")
  (cl-flet ((kill-buffer-ask (buffer) (kill-buffer buffer)))
    (kill-matching-buffers regexp)))

(defun uco-remove(program)
  "Remove this PROGRAM."
  (let ((folder (cdr (assoc "folder" program))))
    (shell-command (concat "rm -rf " folder))))

(defun uco-clean (program)
  "Clear all the buffer of this PROGRAM and delete current frame."
  (slient-kill-buffers (cdr (assoc "name" program)))
  ;;(delete-frame)
  )

(defun uco-done (program)
  "Mark this PROGRAM has been done."
  (let* ((folder (cdr (assoc "folder" program)))
         (dest (concat folder "/../done/"))
         (cmd (concat "mv " folder " " dest)))
    (shell-command cmd)
    (uco-clean program)))

(defun uco-display (program)
  "Display for the exsiting PROGRAM."
  (let* ((name (cdr (assoc "name" program)))
         (folder (concat (cdr  (assoc "folder" program)) "/"))
         (uco-cpp (concat folder name ".cpp"))
         (uco-pro (concat folder name ".pr"))
         (uco-in (concat folder name ".in"))
         (uco-out (concat folder name ".out")))
    (make-frame-command)
    (switch-to-buffer (find-file-noselect uco-cpp))
    (set-window-buffer (split-window-horizontally) (find-file-noselect uco-pro))
    (windmove-right)
    (set-window-buffer (split-window-below) (find-file-noselect uco-in))
    (windmove-down)
    (set-window-buffer (split-window-right) (find-file-noselect uco-out))
    (windmove-left)
    (toggle-frame-fullscreen)))

(setq mac-command-modifier 'super)
(global-set-key (kbd "C-s-f") 'toggle-frame-fullscreen)
(global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)

;;;###auto-load
(defun indent-buffer ()
  "Use this to indent the whole file."
  (interactive)
  (pcase (file-name-extension (buffer-file-name))
    ("js" (web-beautify-js-buffer))
    ("css" (web-beautify-css-buffer))
    ("html" (web-beautify-html-buffer))
    ("hs" (haskell-mode-stylish-buffer))
    ("go" (gofmt))
    ("py" (yapfify-buffer))
    (_ (indent-region (point-min) (point-max)))))

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(sp-use-paredit-bindings)
(spacemacs/set-leader-keys
  "oe" 'helm-find-files
  "ob" 'helm-mini
  "ok" 'kill-buffer
  "ow" 'save-buffer
  "or" 'enzo/run
  "oy" 'browse-kill-ring
  "ou" 'enzo/uco
  "on" 'helm-projectile-find-file
  "oq" 'delete-frame
  "of" 'indent-buffer
  "ot" 'org-show-todo-tree
  "oa" 'show-all
  "o,f" 'ace-jump-mode
  "o,F" 'ace-jump-char-mode
  "o,w" 'ace-jump-word-mode)
(define-key evil-normal-state-map (kbd ",") (lookup-key spacemacs-default-map (kbd "o")))
(define-key evil-motion-state-map (kbd ",") (lookup-key spacemacs-default-map (kbd "o")))

(defun enzo/setup-font (size ratio)
  (when (display-graphic-p)
    (let ((font (if *is-a-mac*
                    "Hiragino Sans GB"
                  "WenQuanYi Zen Hei") ))
      (set-face-attribute 'default t :family "Source Code Pro for Powerline" :weight 'normal)
      (set-face-attribute 'default nil :height size :weight 'normal)
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font t charset (font-spec :name font)))
      (setq face-font-rescale-alist `((,font . ,ratio) ("文泉驿正黑" . 1.2))))))

(add-hook 'org-mode-hook
          (lambda ()
            (face-remap-add-relative 'default
                                     :family "Source Code Pro for Powerline")))

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (enzo/setup-font 150 1.2)
              (when (and *is-a-mac* (display-graphic-p))
                (ns-do-applescript "tell application \"Emacs\" to activate"))
              )))

(require 'pangu-spacing)
(add-hook 'org-mode-hook (lambda () (pangu-spacing-mode 1)))

(add-hook 'org-mode-hook
          '(lambda ()
             (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)))

(defun nasm-format-code-line ()
  "Format line to distinct operator and operands"
  (interactive)
  (let ((size (- 10 (length  (current-word)))))
    (right-word)
    (unless (or (looking-at "[[:space:]]*;")
                (= (line-end-position) (point)))
      (re-search-forward "[[:space:]]+" nil t 1)
      (unless (= size (- (match-end 0) (match-beginning 0)))
        (replace-match (make-string size ?\s))))))

(defun nasm-indent-line ()
  "Indent current line as NASM assembly code."
  (interactive)
  (let ((orig (- (point-max) (point))))
    (back-to-indentation)
    (if (or (looking-at (nasm--opt nasm-directives))
            (looking-at (nasm--opt nasm-pp-directives))
            (looking-at "\\[")
            (looking-at ";;+")
            (looking-at nasm-label-regexp))
        (indent-line-to 0)
      (progn (indent-line-to nasm-basic-offset)
             (unless (or (looking-at-p ";")
                         (looking-at "[[:space:]]*$"))
               (nasm-format-code-line))))
    (when (> (- (point-max) orig) (point))
      (goto-char (- (point-max) orig)))))

(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

(define-coding-system-alias 'UTF-8 'utf-8)
(setq lsp-haskell-process-path-hie "hie-wrapper")
(provide 'enzo-config)
