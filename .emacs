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
(global-hl-line-mode +1) ;; highlith current line
(delete-selection-mode +1) ;; deletes selected text and replace it
(scroll-bar-mode -1)
(setq ns-right-alternate-modifier nil) ;; right option macos key enable
(fset 'yes-or-no-p 'y-or-n-p) ;; Ask y/n instead of yes/no
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; display line number when programming
(show-paren-mode +1) ;; show matching parentheses
(blink-cursor-mode +1)
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
(add-to-list 'default-frame-alist
	     '(font . "Source Code Pro-18"))
;;=-=-=-=-=
;; Packages:
;; 1 org-bullets:
(is-installed 'org-bullets)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; ---end---
;; 2 minimap: like subblime
(is-installed 'minimap)
(require 'minimap)
;; ---end---
;; 3 flyspell:
(setq ispell-program-name "/opt/homebrew/bin/aspell")
;; --end--
;; 4 auctex:
(is-installed 'auctex)
(setenv "PATH" (concat "/Library/TeX/texbin:"
                       (getenv "PATH")))
(add-to-list 'exec-path "/Library/TeX/texbin")
(setq TeX-auto-save t)
(setq TeX-save-query nil)
(setq LaTeX-includegraphics-read-file 'LaTeX-includegraphics-read-file-relative)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq outline-minor-mode-prefix "\C-c\C-o")
(defun add-auctex-keys ()
  (local-set-key (kbd "C-<tab>") 'TeX-complete-symbol))
(add-hook 'LaTeX-mode-hook 'add-auctex-keys)
(is-installed 'latex-preview-pane)
;; PDF-Tools
(is-installed 'pdf-tools)
(setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo")
(pdf-tools-install)
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t)
;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))
(add-hook 'pdf-view-mode-hook
	  (lambda () (pdf-tools-enable-minor-modes)))
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
;(setq TeX-source-correlate-start-server t)
;; -- end auctex --
;; 5 ace-window
(is-installed 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
;; 6 avy
(is-installed 'avy)
(avy-setup-default)
(global-set-key (kbd "M-g f") 'avy-goto-line)
;; 7 multiple-cursors
(is-installed 'multiple-cursors)
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; -- end --
;; 8 mu4e
;;(is-installed 'mu4e)
;; -- end --
;; 9 Git
(is-installed 'magit)
(is-installed 'diff-hl)
(global-set-key (kbd "C-c m") 'magit-status)
(setq diff-hl-fringe-bmp-function 'diff-hl-fringe-bmp-from-type)
(global-diff-hl-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3319c893ff355a88b86ef630a74fad7f1211f006d54ce451aab91d35d018158f" "f91395598d4cb3e2ae6a2db8527ceb83fed79dbaf007f435de3e91e5bda485fb" default))
 '(org-agenda-files
   '("~/ownCloud/today.org" "/Users/gmarx/ownCloud/projects/iProjects.org"))
 '(package-selected-packages
   '(multiple-cursors ace-window latex-preview-pane auctex org-bullets minimap doom-themes))
 '(safe-local-variable-values
   '((TeX-auto-save . t)
     (TeX-parse-self . t)
     (org-attach-use-inheritance . t)
     (LaTeX-includegraphics-read-file . LaTeX-includegraphics-read-file-relative)
     (display-line-numbers . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
