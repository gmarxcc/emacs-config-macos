;;; ------------------------
;;; Emacs configiration file for MacOS
;;; Gerardo Marx June - 2022
;;; ------------------------
;; Melpa repository:
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")t)
;; +++++++++++++
;; My functions:
;; ----
;;function to check installed packages:
(defun is-installed (pack)
  "Check if a package is istalled"
  (unless (package-installed-p pack)
    (package-refresh-contents)
    (package-install pack)))
;; =-=-=-=-=-=-
;; UI behaivior
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)
;; =-=-=-=
;; Themes
(is-installed 'doom-themes)
(require 'doom-themes)
;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(load-theme 'doom-one t)
(doom-themes-visual-bell-config) ; Enable flashing mode-line on errors
;; Enable custom neotree theme
;(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!
;;=-=-=-=-=
;; Packages:
;; 1 org-bullets:
(is-installed 'org-bullets)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; 2 minimap: like subblime
(is-installed 'minimap)
(require 'minimap)


