(add-to-list 'safe-local-variable-values '(org-beamer-outline-frame-title . "目录"))
(setq org-src-fontify-natively t)
(setq org-export-allow-bind-keywords t)
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "|" "SOMEDAY" "|" "DONE" )))

(defvar *beamer*
  '("beamer"
    "\\documentclass[presentation]{beamer}
\\usepackage[no-math]{fontspec}
\\usepackage[BoldFont,SlantFont,AutoFakeBold=true,AutoFakeSlant=true]{xeCJK}
\\setCJKmainfont[BoldFont=FandolSong-Bold.otf,ItalicFont=FandolKai-Regular.otf]{FandolSong-Regular.otf}
\\setCJKsansfont[BoldFont=FandolHei-Bold.otf]{FandolHei-Regular.otf}
\\setCJKmonofont{FandolFang-Regular.otf}
\\usefonttheme[stillsansseriflarge,stillsansserifsmall]{serif}
\\usepackage{graphicx}
\\usepackage{xcolor}
\\usepackage{listings}
\\defaultfontfeatures{Mapping=tex-text}
\\usepackage{geometry}
\\usepackage{verbatim}
\\usepackage{fixltx2e}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage[normalem]{ulem}
\\usepackage{amsmath}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{amssymb}
\\usepackage{hyperref}
\\setlength{\\parindent}{0in}
\\tolerance=1000
     [NO-DEFAULT-PACKAGES]
     [PACKAGES]
     [EXTRA]
"
    ("\\section{%s}" . "\\section*{%s}")
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
    ("\\paragraph{%s}" . "\\paragraph*{%s}")
    ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
  "Beamer org export latex config.")
(defvar *book*
  '("book"
    "\\documentclass{book}"
    ("\\section{%s}" . "\\section*{%s}")
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
    ("\\paragraph{%s}" . "\\paragraph*{%s}")
    ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
  "Book org export latex config.")
(defvar *article*
  '("article"
    "\\documentclass[11pt,a4paper]{article}
\\usepackage{fontspec}
\\usepackage{xeCJK}
\\setCJKmainfont[BoldFont=FandolSong-Bold.otf,ItalicFont=FandolKai-Regular.otf]{FandolSong-Regular.otf}
\\setCJKsansfont[BoldFont=FandolHei-Bold.otf]{FandolHei-Regular.otf}
\\setCJKmonofont{FandolFang-Regular.otf}
\\usepackage{graphicx}
\\usepackage{xcolor}
\\usepackage{listings}
\\defaultfontfeatures{Mapping=tex-text}
\\usepackage{geometry}
\\usepackage{verbatim}
\\usepackage{fixltx2e}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage[normalem]{ulem}
\\usepackage{amsmath}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{amssymb}
\\usepackage{hyperref}
\\usepackage{parskip}
\\setlength{\\parindent}{15pt}
\\usepackage{indentfirst}
\\geometry{a4paper, textwidth=6.5in, textheight=10in,
            marginparsep=7pt, marginparwidth=.6in}
\\tolerance=1000
\\pagestyle{empty}
     [NO-DEFAULT-PACKAGES]
     [NO-PACKAGES]
 "
    ("\\section{%s}" . "\\section*{%s}")
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
    ("\\paragraph{%s}" . "\\paragraph*{%s}")
    ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
  "Acticle org export latex config.")

(eval-after-load "org"
  '(progn
     (require 'ox-md nil t)
     (require 'ox-latex)
     (setq org-latex-pdf-process
           '("xelatex -interaction nonstopmode %f"
             "xelatex -interaction nonstopmode %f"))
     (unless (boundp 'org-latex-classes)
       (setq org-latex-classes nil))
     (setq org-latex-listings 'listings)
     ;;(setq org-latex-custom-lang-environments '((emacs-lisp "common-lispcode")))
     (setq org-latex-listings-options
           '(("frame" "single")
             ("backgroundcolor" "\\color[gray]{0.95}")
             ("identifierstyle" "\\ttfamily")
             ("keywordstyle" "\\color[rgb]{0,0,1}")
             ("commentstyle" "\\color[rgb]{0.133,0.545,0.133}")
             ("stringstyle" "\\color[rgb]{0.627,0.126,0.941}")
             ("basicstyle" "\\scriptsize")
             ("extendedchars" "true")
             ("breaklines" "true")
             ("prebreak" "\\raisebox{0ex}[0ex][0ex]{\\ensuremath{\\hookleftarrow}}")
             ("columns" "fixed")
             ("keepspaces" "true")
             ("showstringspaces" "false")
             ("numbers" "left")
             ("xleftmargin" ".25in")
             ("xrightmargin" ".25in")
             ("numberstyle" "\\tiny")))
     (require 'ox-beamer)
     (dolist (class (list *article* *book* *beamer*))
       (add-to-list 'org-latex-classes
                    class))))
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t) (plantuml . t) (gnuplot . t)))
(setf plantuml-jar-path (expand-file-name "plantuml.jar" (file-name-directory user-init-file)))
(setq org-plantuml-jar-path plantuml-jar-path)
(setq org-descriptive-links nil)

;; org 自动换行
(add-hook 'org-mode-hook
          (lambda ()
            (turn-off-auto-fill)
            (toggle-truncate-lines 0)))

(defadvice org-html-paragraph (before org-html-paragraph-advice
                                      (paragraph contents info) activate)
  "Join consecutive Chinese lines into a single long line without unwanted space when exporting 'org-mode to html."
  (let* ((origin-contents (ad-get-arg 1))
         (fix-regexp "[[:multibyte:]]")
         (fixed-contents
          (replace-regexp-in-string
           (concat
            "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)") "\\1\\2" origin-contents)))
    (ad-set-arg 1 fixed-contents)))

(require 'tex)
(require 'tex-buf)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq-default TeX-engine 'xetex)
(setq-default TeX-PDF-mode t)
;; set XeTeX mode in TeX/LaTeX
(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
            (turn-on-reftex)
            (setq TeX-command-default "XeLaTeX")
            (setq TeX-save-query nil)
            (setq TeX-show-compilation t)))

(provide 'enzo-org)
