;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Tomasz Lutoborski"
      user-mail-address "tomasz@lutoborski.net")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14 :weight 'bold)
      doom-variable-pitch-font (font-spec :family "Open Sans" :size 14 :weight 'semi-bold))

(set-window-margins (selected-window) 1 1)
(edt-set-scroll-margins "20%" "20%")
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)
(setq doom-themes-treemacs-theme "doom-colors")
(setq doom-themes-treemacs-root-face "shortdoc-section")
(setq doom-themes-treemacs-line-spacing 0.55)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq lsp-zig-zls-executable "~/zls/zls")

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.6))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.4))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.25))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.15))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)

(setq-default explicit-shell-file-name "/usr/bin/bash")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(use-package! evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


(map! :leader :desc "Toggle treemacs" :n "e" #'treemacs)
(map! :desc "Next buffer" :n "L" #'next-buffer)
(map! :desc "Prev buffer" :n "H" #'previous-buffer)
(map! :leader :desc "Yank from clipboard" :n "v" #'clipboard-yank)
(map! :desc "Jump to right window" :n "M-l" #'evil-window-right)
(map! :desc "Jump to left window" :n "M-h" #'evil-window-left)
(map! :desc "Jump to bottom window" :n "M-j" #'evil-window-down)
(map! :desc "Jump to up window" :n "M-k" #'evil-window-up)

(after! org
        (setq org-roam-directory "~/Documents/org/roam/")
        (setq org-roam-index-file "~/Documents/org/roam/index.org"))
