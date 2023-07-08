;; See:  https://clojure-lsp.io/
;; also: https://emacs-lsp.github.io/lsp-mode/
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :bind
  ("M-<f7>" . lsp-find-references)
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (clojure-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; First install the package:
(use-package flycheck-clj-kondo)

;; then install the checker as soon as `clojure-mode' is loaded
(defun clojure-word-chars ()
  "Add more special characters " "for Clojure."
  (modify-syntax-entry ?+ "w")
  (modify-syntax-entry ?- "w")
  (modify-syntax-entry ?< "w")
  (modify-syntax-entry ?> "w"))

(use-package clojure-mode
  :config
  (require 'flycheck-clj-kondo)
  :hook
  (clojure-mode . paredit-mode)
  (clojure-mode . clojure-word-chars))

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

;; ;; CIDER is a whole interactive development environment for
;; ;; Clojure. There is a ton of functionality here, so be sure
;; ;; to check out the excellent documentation at
;; ;; https://docs.cider.mx/cider/index.html
(use-package cider
  :config
  (setq
   cider-show-error-buffer t
   cider-auto-select-error-buffer t
   cider-repl-history-file "~/.emacs.d/cider-history"
   cider-repl-pop-to-buffer-on-connect 'display-only
   cider-repl-wrap-history t
   cider-stacktrace-default-filters '(tooling dup java))
  (cider-repl-toggle-pretty-printing)
  :hook
  (cider-repl-mode . paredit-mode)
  )

;; ;; hydra provides a nice looking menu for commands
;; ;; to see what's available, use M-x and the prefix cider-hydra
;; ;; https://github.com/clojure-emacs/cider-hydra
;; (setup (:package cider-hydra)
;;   (:hook-into clojure-mode))

;; additional refactorings for CIDER
;; e.g. add missing libspec, extract function, destructure keys
;; https://github.com/clojure-emacs/clj-refactor.el
(use-package clj-refactor
  :preface
  (defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    (cljr-add-keybindings-with-prefix "s-c r"))
    :hook
    (clojure-mode . my-clojure-mode-hook)
 )


;; https://github.com/Malabarba/aggressive-indent-mode
(use-package aggressive-indent
  :init
  (setq aggressive-indent-sit-for-time 1.0) ;; set higher if you need more time to think
  :hook
  (clojure-mode . aggressive-indent-mode)
  )

