;; https://agel.readthedocs.io/en/latest/installation.html#emacs
;; (use-package ag)

(use-package yasnippet)

(use-package flymake-golangci)
;; go install github.com/nsf/gocode@latest
(use-package go-autocomplete)
(use-package go-eldoc)

(defun my-go-mode-hook()
    (set (make-local-variable 'go-test-args) "-tags integration")
    )

(use-package go-mode
  :config
    (define-key go-mode-map (kbd "C-c C-t f") 'go-test-current-file)
    (define-key go-mode-map (kbd "C-c C-t t") 'go-test-current-test)
    (define-key go-mode-map (kbd "C-c C-t p") 'go-test-current-project)
    (define-key go-mode-map (kbd "C-c C-t b") 'go-test-current-benchmark)
    (auto-complete-mode 1)
    (setq gofmt-command "goimports")
    :hook
    (go-mode . flymake-golangci-load)
    (go-mode . go-eldoc-setup)
    (go-mode . my-go-mode-hook)
  )

;;go install golang.org/x/tools/gopls@latest
(use-package lsp-mode
  :config
  (setq lsp-go-env '((GOFLAGS . "-tags=integration")))
  :hook
    (go-mode . lsp-deferred)
  )

;; https://github.com/weijiangan/flycheck-golangci-lint
(use-package flycheck-golangci-lint)

