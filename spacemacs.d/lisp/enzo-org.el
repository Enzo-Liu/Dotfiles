(add-to-list 'safe-local-variable-values '(org-beamer-outline-frame-title . "目录"))
(setq org-agenda-files (list "~/Documents/org/work/" "~/Documents/agora/weekly-report/"))
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
(defvar *tr-article*
  '("tr-article"
    "\\documentclass[11pt,a4paper]{article}
\\usepackage{fontspec}
\\usepackage{xeCJK}
\\setCJKmainfont[BoldFont=WenQuanYi Zen Hei Sharp,ItalicFont=WenQuanYi Micro Hei]{WenQuanYi Zen Hei}
\\setCJKsansfont{WenQuanYi Zen Hei}
\\setCJKmonofont{WenQuanYi Zen Hei Mono}
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
\\setlength{\\parindent}{0pt}
\\usepackage{indentfirst}
\\usepackage[strict]{changepage}
\\usepackage{framed}
\\definecolor{formalshade}{rgb}{0.95,0.95,1}
\\newenvironment{formal}{%
  \\def\\FrameCommand{%
    \\hspace{1pt}%
    {\\color{darkgray}\\vrule width 2pt}%
    {\\color{formalshade}\\vrule width 2pt}%
    \\colorbox{formalshade}%
  }%
  \\MakeFramed{\\advance\\hsize-\\width\\FrameRestore}%
  \\noindent\\hspace{-2.55pt}% disable indenting first paragraph
  \\begin{adjustwidth}{}{2pt}%
}
{%
  \\vspace{2pt}\\end{adjustwidth}\\endMakeFramed%
}
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
\\setlength{\\parindent}{0pt}
\\usepackage{indentfirst}
\\usepackage[strict]{changepage}
\\usepackage{framed}
\\definecolor{formalshade}{rgb}{0.95,0.95,1}
\\newenvironment{formal}{%
  \\def\\FrameCommand{%
    \\hspace{1pt}%
    {\\color{darkgray}\\vrule width 2pt}%
    {\\color{formalshade}\\vrule width 2pt}%
    \\colorbox{formalshade}%
  }%
  \\MakeFramed{\\advance\\hsize-\\width\\FrameRestore}%
  \\noindent\\hspace{-2.55pt}% disable indenting first paragraph
  \\begin{adjustwidth}{}{2pt}%
}
{%
  \\vspace{2pt}\\end{adjustwidth}\\endMakeFramed%
}
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

(defun org-sitemap-custom-entry-format (entry style project)
  (let ((filename (org-publish-find-title entry project)))
    (if (= (length filename) 0)
        (format "*%s*" (if (directory-name-p entry)
                           (substring entry 0 (- (length entry) 1))
                         entry))
      (format "%s - [[file:%s][%s]]"
              (format-time-string "%Y-%m-%d" (org-publish-find-date entry project))
              entry
              filename))))

(with-eval-after-load 'org
  (progn
     (require 'ox-md nil t)
     (require 'ox-latex)
     (require 'ob-gnuplot)
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
     (dolist (class (list *article* *book* *beamer* *tr-article*))
       (add-to-list 'org-latex-classes
                    class))
     (require 'ox-publish)
     (setq org-publish-project-alist
           '(
             ("org-agora-index"
              :base-directory "~/Documents/agora/"
              :base-extension "org"
              :exclude ".*"
              :include ["index.org"]
              :publishing-directory "/usr/local/var/www"
              :publishing-function org-html-publish-to-html
              :table-of-contents nil
              :html-head-extra  "<link rel='stylesheet' type='text/css' href='styles/readtheorg/css/htmlize.css'/><link rel='stylesheet' type='text/css' href='styles/readtheorg/css/readtheorg.css'/>"
              )
             ("org-agora-notes"
              :base-directory "~/Documents/agora/"
              :base-extension "org"
              :publishing-directory "/usr/local/var/www"
              :recursive t
              :publishing-function org-html-publish-to-html
              :headline-levels 3             ; Just the default for this project.
              :auto-preamble t
              :auto-sitemap t                ; Generate sitemap.org automagically...
              :sitemap-filename "index.org"  ; ... call it sitemap.org (it's the default)...
              :sitemap-format-entry org-sitemap-custom-entry-format
              :html-link-home "/"
              :sitemap-title "文档列表"         ; ... with title 'Sitemap'.
              :section-numbers nil
              :table-of-contents 2
              :sitemap-filename "index.org"
              :sitemap-sort-files anti-chronologically
              :exclude "index.org"
              :html-head-extra  "<link rel='stylesheet' type='text/css' href='../styles/readtheorg/css/htmlize.css'/><link rel='stylesheet' type='text/css' href='../styles/readtheorg/css/readtheorg.css'/>"
              )
             ("org-agora-static"
              :base-directory "~/Documents/agora/"
              :base-extension "gz\\|eps\\|css\\|js\\|png\\|jpg\\|gif\\|mp3\\|ogg\\|swf"
              :publishing-directory "/usr/local/var/www"
              :recursive t
              :publishing-function org-publish-attachment
              )
             ("org-agora" :components ("org-agora-notes" "org-agora-static" "org-agora-index" ))
             ;; ... add all the components here (see below)...
             ))

     ))
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (lisp . t)
   (ditaa . t)
   (dot . t)
   (plantuml . t)
   (gnuplot . t)
   (shell . t)
   (ruby . t)
   (python . t)
   ))
(push '(png . "pngcairo") *org-babel-gnuplot-terms*)
(setf plantuml-jar-path (expand-file-name "plantuml.jar" (file-name-directory user-init-file)))
(setq org-plantuml-jar-path plantuml-jar-path)
(add-to-list 'org-babel-default-header-args:plantuml
             '(:java . "-Djava.awt.headless=true"))
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

(setq org-image-actual-width 800)

(defun todoToNum (s)
  (cond
   ((string= s"DOING") 1)
   ((string= s "TODO") 2)
   ((string= s "DONE") 3)
   ((string= s"SOMEDAY") 4)
   (t 5)
    )
  )
(defun headToTbl ()
  (interactive)
  (let (items)
    (org-map-entries (lambda ()
                       (let (
                             (item (org-entry-get nil "ITEM"))
                             (todo (org-entry-get nil "TODO"))
                             (scheduled (org-entry-get nil "SCHEDULED"))
                             (closed (org-entry-get nil "CLOSED"))
                             )
                         (push (list (concat "[[*" item "]]") todo scheduled closed) items))) "TODO<>\"\"")
    (setq-local items (sort items (lambda (a b)
                                    (print (todoToNum (nth 1 a)))
                                    (< (todoToNum (nth 1 a))
                                       (todoToNum (nth 1 b))))))
    (push 'hline items)
    (push (list "task" "status" "scheduled" "closed") items)
    items)
  )

(provide 'enzo-org)
