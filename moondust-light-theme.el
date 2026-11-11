;;; moondust-light-theme.el --- Near Side of the Moon -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Blake Caven
;; Source Author: Ivan Uhalin
;; Source: https://github.com/vanyauhalin/moondusttheme
;;
;;; Commentary:
;;
;; Near Side of the Moon.
;; A Doom Emacs port of the Moondust VS Code theme.
;;
;; Modifications:
;; - bright comments (pink/bold)
;; - light orange numbers
;;; Code:

(require 'doom-themes)

;;
;;; Variables

(defgroup moondust-light-theme nil
  "Options for the `moondust-light' theme."
  :group 'doom-themes)

(defcustom moondust-light-brighter-modeline nil
  "If non-nil, use a blue modeline background."
  :group 'moondust-light-theme
  :type 'boolean)

(defcustom moondust-light-padded-modeline doom-themes-padded-modeline
  "If non-nil, add padding to the mode-lined.
Can be an integer to determine the exact padding."
  :group 'moondust-light-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme moondust-light
  "Near Side of the Moon."

  :family 'moondust
  :background-mode 'light

  ;; name        default                 256                     16
  ((bg         '("#FFFFFF"             "white"                 "white"))
   (fg         '("#434A51"             "black"                 "black"))

   ;; Background and foreground variants
   (bg-alt     '("#F6F7F8"             "white"                 "white"))
   (fg-alt     '("#71787F"             "brightblack"           "brightblack"))

   ;; Grayscale spectrum
   (base0      '("#F6F7F8"             "white"                 "white"))
   (base1      '("#E8EBED"             "white"                 "white"))
   (base2      '("#D7DCDF"             "brightwhite"           "brightwhite"))
   (base3      '("#B6BEC3"             "brightwhite"           "brightwhite"))
   (base4      '("#8E979F"             "brightblack"           "brightblack"))
   (base5      '("#71787F"             "brightblack"           "brightblack"))
   (base6      '("#575E66"             "brightblack"           "brightblack"))
   (base7      '("#434A51"             "black"                 "black"))
   (base8      '("#33383D"             "black"                 "black"))

   ;; Accent colors
   (grey       base5)
   (red        '("#B35900"             "red"                   "red"))
   (orange     '("#7D4E00"             "yellow"                "yellow"))
   (green      '("#575E66"             "green"                 "green"))
   (teal       '("#65A4D7"             "cyan"                  "cyan"))
   (yellow     '("#3882C2"             "yellow"                "yellow"))
   (blue       '("#3882C2"             "blue"                  "blue"))
   (dark-blue  '("#144B7B"             "blue"                  "blue"))
   (magenta    '("#575E66"             "magenta"               "magenta"))
   (violet     '("#65A4D7"             "magenta"               "magenta"))
   (cyan       '("#65A4D7"             "cyan"                  "cyan"))
   (dark-cyan  '("#1F639E"             "cyan"                  "cyan"))
   (bright-pink '("#f88bee"            "brightpink"            "brightpink"))
   (light-orange '("#B35900"           "lightorange"           "lightorange"))
   ;; Additional Moondust colors
   (slate      '("#1F639E"             "cyan"                  "cyan"))
   (slate-bright '("#3882C2"           "brightcyan"            "brightcyan"))

   ;; Universal syntax classes
   (highlight      slate-bright)
   (vertical-bar   (doom-lighten base1 0.1))
   (selection      base2)
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
   (region         base2)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    blue)
   (vc-added       green)
   (vc-deleted     red)

   ;; Modeline
   (modeline-fg              fg)
   (modeline-fg-alt          base6)
   (modeline-bg              (if moondust-light-brighter-modeline
                                 (doom-lighten blue 0.45)
                               (doom-lighten bg-alt 0.1)))
   (modeline-bg-alt          (if moondust-light-brighter-modeline
                                 (doom-lighten blue 0.475)
                               `(,(doom-lighten (car bg-alt) 0.15)
                                 ,@(cdr bg))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-lighten (car bg-alt) 0.1)
                               ,@(cdr bg)))

   ;; Modeline padding
   (-modeline-pad
    (when moondust-light-padded-modeline
      (if (integerp moondust-light-padded-modeline)
          moondust-light-padded-modeline
        4))))

  ;;
  ;;; Face overrides

  (((line-number &override)
    :foreground base4)

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
    :foreground (if moondust-light-brighter-modeline base8 highlight))

   ;; Doom Modeline
   (doom-modeline-bar
    :background (if moondust-light-brighter-modeline modeline-bg highlight))

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
    :foreground bg)

   (company-tooltip-common
    :foreground blue)

   (company-scrollbar-bg
    :background base2)

   (company-scrollbar-fg
    :background base5)

   ;; Ivy
   (ivy-current-match
    :background dark-blue
    :distant-foreground bg
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

;;; moondust-light-theme.el ends here
