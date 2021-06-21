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

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 16 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 18))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'nord)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)
(+global-word-wrap-mode +1)
(setq +format-on-save-enabled-modes
      '(not python-mode))

(after! rustic
  (setq rustic-lsp-server 'rls))

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
;;
(setq mac-right-option-modifier 'meta)


;; evil setting
(setq evil-split-window-below t)
(setq evil-vsplit-window-right t)
(setq evil-snipe-override-evil-repeat-keys nil)

;; unicode-font
(setq doom-unicode-font doom-font)

;; project
(setq projectile-project-search-path '("~/Github/" "~/Work/" "~/Work/Trove/Redis" "~/Work/Trove/InfluxDB" "~/Work/Trove/MongoDB" "~/Work/Trove/Rabbitmq"))
(map! :after ccls
      :map (c-mode-map c++-mode-map)
      :n "C-h" #'tmux-pane-omni-window-left
      :n "C-j" #'tmux-pane-omni-window-down
      :n "C-k" #'tmux-pane-omni-window-up
      :n "C-l" #'tmux-pane-omni-window-right)

;; tmux
(use-package! tmux-pane
  :config
  (tmux-pane-mode)
  (map! :leader
        (:prefix ("v" . "tmux pane")
          :desc "Open vpane" :nv "o" #'tmux-pane-open-vertical
          :desc "Open hpane" :nv "h" #'tmux-pane-open-horizontal
          :desc "Open hpane" :nv "s" #'tmux-pane-open-horizontal
          :desc "Open vpane" :nv "v" #'tmux-pane-open-vertical
          :desc "Close pane" :nv "c" #'tmux-pane-close
          :desc "Rerun last command" :nv "r" #'tmux-pane-rerun))
  (map! :leader
        (:prefix "t"
          :desc "vpane" :nv "v" #'tmux-pane-toggle-vertical
          :desc "hpane" :nv "h" #'tmux-pane-toggle-horizontal)
  )
)

(setq deft-directory "~/org/"
      deft-extensions '("org" "txt")
      deft-recursive t)

(after! org
  ;; use ctrl-a ctrl-e as home and end in org mode.
  (setq org-directory "~/org/")
  (setq org-link-search-must-match-exact-headline nil)
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

(setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org")

(setq org-roam-directory "~/org/roam")
(setq org-journal-file-type 'weekly)
