;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "mohenoo"
      user-mail-address "mohenoo@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 13))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; Depending on context, it performs one of the following actions:
;; When on an empty item or table row, abort or split the item list or table.
;; When on a non-empty item or table row, continue the item list or table.
;; Otherwise, insert a newline and indent.

;; evil setting
(setq evil-split-window-below t)
(setq evil-vsplit-window-right t)

;; unicode-font
(setq doom-unicode-font doom-font)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(after! org
  ;; use ctrl-a ctrl-e as home and end in org mode.
  (setq org-special-ctrl-a/e t)
  (setq org-agenda-files '("~/org"))
  (setq org-default-notes-file (concat org-directory "~/org/notes.org"))
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
           "* TODO %?\n  %U\n %i\n  %a")
          ("T" "Tickler" entry (file+headline "~/org/tickler.org" "Ticker") "* %i%? \n %U")
          ("r" "Report" entry (file+datetree "~/org/report.org")
           "* %?\nEntered on %U\n  %i\n  %a")))
  (setq org-refile-targets '(("~/org/gtd.org" :maxlevel . 3)
                             ("~/org/someday.org" :level . 1)
                             ("~/org/tickler.org" :maxlevel . 2)))
  )
