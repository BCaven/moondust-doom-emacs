;;; moondust-dark-theme.el --- Far Side of the Moon -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Blake Caven
;; Source Author: Ivan Uhalin
;; Source: https://github.com/vanyauhalin/moondusttheme
;;
;;; Commentary:
;;
;; Far Side of the Moon.
;; A Doom Emacs port of the Moondust VS Code theme.
;;
;; Modifications:
;; - bright comments (pink/bold)
;; - light orange numbers
;;; Code:

(require 'doom-themes)

;;
;;; Variables

(defgroup moondust-dark-theme nil
  "Options for the `moondust-dark' theme."
  :group 'doom-themes)

(defcustom moondust-dark-brighter-modeline nil
  "If non-nil, use a blue modeline background."
  :group 'moondust-dark-theme
  :type 'boolean)

(defcustom moondust-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, add padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'moondust-dark-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme moondust-dark
  "Dark Side of the Moon."

  :family 'moondust
  :background-mode 'dark

  ;; name        default                 256                     16
  ((bg         '("#161A1D"             "black"                 "black"))
   (fg         '("#B1B6B9"             "white"                 "brightwhite"))

   ;; Background and foreground variants
   (bg-alt     '("#1E2225"             "black"                 "black"))
   (fg-alt     '("#89949A"             "brightblack"           "brightwhite"))

   ;; Grayscale spectrum
   (base0      '("#1E2225"             "black"                 "black"))
   (base1      '("#22272B"             "black"                 "black"))
   (base2      '("#262C31"             "brightblack"           "brightblack"))
   (base3      '("#2C343A"             "brightblack"           "brightblack"))
   (base4      '("#343F46"             "brightblack"           "brightblack"))
   (base5      '("#455259"             "brightblack"           "brightblack"))
   (base6      '("#637179"             "brightblack"           "brightblack"))
   (base7      '("#89949A"             "brightblack"           "brightwhite"))
   (base8      '("#B1B6B9"             "white"                 "brightwhite"))

   ;; Accent colors
   (grey       base5)
   (red        '("#B1B6B9"             "red"                   "red"))
   (orange     '("#B1B6B9"             "yellow"                "yellow"))
   (green      '("#89949A"             "green"                 "green"))
   (teal       '("#8FAFCC"             "cyan"                  "cyan"))
   (yellow     '("#B2D0EB"             "yellow"                "yellow"))
   (blue       '("#3A82CF"             "blue"                  "brightblue"))
   (dark-blue  '("#173E6E"             "blue"                  "blue"))
   (magenta    '("#89949A"             "magenta"               "magenta"))
   (violet     '("#8FAFCC"             "magenta"               "brightmagenta"))
   (cyan       '("#8FAFCC"             "cyan"                  "brightcyan"))
   (dark-cyan  '("#6885A1"             "cyan"                  "cyan"))
   (bright-pink '("#f88bee"            "brightpink"            "brightpink"))
   (light-orange '("#cdb7aa"           "lightorange"           "lightorange"))
   ;; Additional Moondust colors
   (slate      '("#6885A1"             "cyan"                  "cyan"))
   (slate-bright '("#8FAFCC"           "brightcyan"            "brightcyan"))

   ;; Universal syntax classes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        base7)
   (comments       bright-pink)
   (doc-comments   base6)
   (constants      base7)
   (functions      base7)
   (keywords       base7)
   (methods        base7)
   (operators      base6)
   (type           base6)
   (strings        slate)
   (variables      base7)
   (numbers        bright-pink)

   ;; Status colors
   (region         dark-blue)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    blue)
   (vc-added       green)
   (vc-deleted     red)

   ;; Modeline
   (modeline-fg              fg)
   (modeline-fg-alt          base6)
   (modeline-bg              (if moondust-dark-brighter-modeline
                                 (doom-darken blue 0.45)
                               (doom-darken bg-alt 0.1)))
   (modeline-bg-alt          (if moondust-dark-brighter-modeline
                                 (doom-darken blue 0.475)
                               `(,(doom-darken (car bg-alt) 0.15)
                                 ,@(cdr bg))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1)
                               ,@(cdr bg)))

   ;; Modeline padding
   (-modeline-pad
    (when moondust-dark-padded-modeline
      (if (integerp moondust-dark-padded-modeline)
          moondust-dark-padded-modeline
        4))))

  ;;
  ;;; Face overrides

  (((line-number &override)
    :foreground base5)

   ((line-number-current-line &override)
    :foreground fg)

   ((font-lock-comment-face &override)
    :background 'unspecified
    :weight 'bold)

   ((font-lock-number-face &override)
    :background 'unspecified
    :foreground light-orange)

   ((highlight-numbers-number &override)
    :background 'unspecified
    :foreground light-orange)


   (mode-line
    :background modeline-bg
    :foreground modeline-fg
    :box (if -modeline-pad
             `(:line-width ,-modeline-pad :color ,modeline-bg)))

   (mode-line-inactive
    :background modeline-bg-inactive
    :foreground modeline-fg-alt
    :box (if -modeline-pad
             `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))

   (mode-line-emphasis
    :foreground (if moondust-dark-brighter-modeline base8 highlight))

   ;; Doom Modeline
   (doom-modeline-bar
    :background (if moondust-dark-brighter-modeline modeline-bg highlight))

   (doom-modeline-buffer-file
    :inherit 'mode-line-buffer-id
    :weight 'bold)

   (doom-modeline-buffer-path
    :inherit 'mode-line-emphasis
    :weight 'bold)

   (doom-modeline-buffer-project-root
    :foreground slate-bright
    :weight 'bold)

   ;; Completion
   (company-tooltip
    :background base1
    :foreground fg)

   (company-tooltip-selection
    :background dark-blue
    :foreground base8)

   (company-tooltip-common
    :foreground blue)

   (company-scrollbar-bg
    :background base2)

   (company-scrollbar-fg
    :background base5)

   ;; Ivy
   (ivy-current-match
    :background dark-blue
    :distant-foreground base0
    :weight 'normal)

   ;; Org
   (org-block
    :background base1)

   (org-code
    :foreground strings)

   (org-verbatim
    :foreground strings)

   (org-link
    :foreground blue
    :underline t)

   ;; Markdown
   (markdown-markup-face
    :foreground base5)

   (markdown-header-face
    :inherit 'bold
    :foreground base8)

   ((markdown-code-face &override)
    :background base1)

   ;; CSS
   (css-property
    :foreground base7)

   (css-selector
    :foreground blue)

   (css-value
    :foreground strings)

   ;; Git
   (magit-diff-added
    :foreground green
    :background base1)

   (magit-diff-removed
    :foreground red
    :background base1)

   (magit-diff-changed
    :foreground blue
    :background base1)

   (magit-branch-local
    :foreground blue)

   (magit-branch-remote
    :foreground strings)

   ;; Solaire
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad
             `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))

   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad
             `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt))))

  ;; No additional variable overrides
  ())

;;; moondust-dark-theme.el ends here
