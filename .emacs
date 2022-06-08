;;; ------------------------
;;; Emacs configiration file for MacOS
;;; Gerardo Marx June - 2022
;;; ------------------------
;; Melpa repository:
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")t)
;; Packages:
;; 1. org-bullets
(is-installed 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;;; +++++++++++++
;;; My functions:
;; ----
;;function to check installed packages:
(defun is-installed (pack)
  "Check if a package is istalled"
  (unless (package-installed-p pack)
    (package-refresh-contents)
    (package-install pack)))
;;=-=-=-=-=
