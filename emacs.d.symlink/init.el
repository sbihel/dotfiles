; Use the package manager
(require 'package)

(setq package-enable-at-startup nil)

; Sets package management sources
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(menu-bar-mode -1)
; Don't display the ugly startup message (particularly ugly in the GUI)
(setq inhibit-startup-message t)

; Initialize the package manager
(package-initialize)

;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; Enable use-package
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

(use-package gruvbox-theme)
(use-package color-theme-sanityinc-tomorrow)

; Use evil mode
(use-package evil
  :config
  (evil-mode t)
)

(cua-mode t)

(use-package powerline)
(use-package powerline-evil)
(powerline-evil-center-color-theme)

(use-package auto-complete)
; (use-package auto-complete-config)
(ac-config-default)
(use-package yasnippet)
(yas-global-mode 1)
(use-package go-autocomplete)
(use-package auto-complete-clang)

(use-package autopair
  :config
  (autopair-global-mode 1)
  (setq autopair-autowrap t)
)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; esc quits
(defun minibuffer-keyboard-quit ()
    "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
        (setq deactivate-mark  t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
      (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

(setq-default tab-width 4 indent-tabs-mode nil)

(setq fill-column 80)
(setq text-mode-hook 'turn-on-auto-fill)

(setq org-src-fontify-natively t)
(use-package htmlize)
(setq org-html-htmlize-output-type 'css)
(setq org-html-checkbox-type 'html)
(setq org-export-with-broken-links 'mark)
(use-package table)
(use-package ox-pandoc)
(require 'ox-md)

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1)
)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(pandoc ## ox-pandoc yasnippet use-package powerline-evil htmlize helm gruvbox-theme go-mode go-autocomplete flycheck esup color-theme-sanityinc-tomorrow autopair auto-complete-clang)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
