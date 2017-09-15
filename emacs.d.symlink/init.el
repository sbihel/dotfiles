; Use the package manager
(require 'package)

; Sets package management sources
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives
               '("gnu" . "http://elpa.gnu.org/packages/")))

(menu-bar-mode -1)
; Don't display the ugly startup message (particularly ugly in the GUI)
(setq inhibit-startup-message t)

; Initialize the package manager
(package-initialize)

(require 'gruvbox-theme)

; Use evil mode
(require 'evil)
(evil-mode t)

(require 'powerline)
(require 'powerline-evil)
(powerline-evil-center-color-theme)

(require 'auto-complete-config)
(ac-config-default)
(require 'yasnippet)
(yas-global-mode 1)
(require 'go-autocomplete)
(require 'auto-complete-clang)

(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

(require 'flycheck)
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

;; Added by Kite
(load-file "~/.emacs.d/kite.el)

;; Added by Kite
(load-file "~/.emacs.d/kite.el)

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")

;; Added by Kite
(load-file "~/.emacs.d/kite.el")
