; Use the package manager
(require 'package)

(setq package-enable-at-startup nil)

; Sets package management sources
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))

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

; Use evil mode
(use-package evil)
(evil-mode t)

(cua-mode t)

(use-package powerline)
(use-package powerline-evil)
(powerline-evil-center-color-theme)

(use-package auto-complete-config)
(ac-config-default)
(use-package yasnippet)
(yas-global-mode 1)
(use-package go-autocomplete)
(use-package auto-complete-clang)

(use-package autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

(use-package flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

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

(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
(cons '("\\.m$" . octave-mode) auto-mode-alist))

;; (add-hook 'org-mode-hook
;;   '(lambda()
;;     (setq fill-column 80)))
(setq fill-column 80)
(setq text-mode-hook 'turn-on-auto-fill)
(setq org-mode 'text-mode)


;; Added by Kite
(load-file "~/.emacs.d/kite.el")
