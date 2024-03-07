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
  (clojure-mode . clojure-word-chars)
  (clojure-mode . eglot-ensure) ;; see https://joaotavora.github.io/eglot/ and https://clojure-lsp.io
  )

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

(defun akutschera/run-clj-test ()
  "runs the test where the point is currently in, no matter where the point is"
  (interactive)
  (end-of-defun)
  (backward-char)
  (backward-char)
  (cider-eval-last-sexp)
  )

(defun akutschera/clj-compile-after-save ()
  "load current buffer into repl after save."
  (when (and (not (string-match "project.clj" (buffer-file-name)))
             (or (string-match ".\\.cljc$" (buffer-file-name)) (string-match ".\\.clj$" (buffer-file-name)))
	     )
    (cider-load-buffer)))

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
  :bind
  ("<f5>" . akutschera/run-clj-test)
  :hook
  (cider-mode . (lambda ()
            (add-hook 'after-save-hook 'akutschera/clj-compile-after-save nil 'make-it-local)))
  (cider-mode . cider-company-enable-fuzzy-completion)
  (cider-repl-mode . cider-company-enable-fuzzy-completion)
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
  :config
  (setq
   cljr-warn-on-eval nil
   )
  :hook
    (clojure-mode . my-clojure-mode-hook)
 )

;; override clj-refactor template
(defcustom cljr-clojure-test-declaration "[clojure.test :as t :refer [deftest is testing]]"
  "The require form to use when clojure.test is in use in a clj file."
  :type 'string
  :safe #'stringp)

;; https://github.com/Malabarba/aggressive-indent-mode
(use-package aggressive-indent
  :init
  (setq aggressive-indent-sit-for-time 1.0) ;; set higher if you need more time to think
  :hook
  (clojure-mode . aggressive-indent-mode)
  )

