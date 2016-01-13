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

; Use evil mode
(require 'evil)
(evil-mode t)

(require 'powerline)
(require 'powerline-evil)
(powerline-evil-center-color-theme)

(require 'auto-complete-config)
(ac-config-default)
(require 'go-autocomplete)
