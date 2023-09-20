;; https://github.com/bbatsov/projectile
;; https://docs.projectile.mx/projectile/usage.html
(use-package projectile
  :init
  (projectile-mode +1)
  :config
  (setq projectile-create-missing-test-files 1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)))

(global-set-key (kbd "M-#") 'xref-find-references) ;; M-? is used by paredit

;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :config
  (setq treemacs-project-follow-mode 1)
  (setq treemacs-project-follow-cleanup 1)
  (setq treemacs-display-current-project-exclusively 1)

  ;; ignore some files that do not belong to projects
  ;; see https://github.com/dakra/dmacs/blob/master/init.org#treemacs-a-tree-layout-file-explorer
  (defun custom-treemacs-ignore (filename absolute-path)
    (or (string-equal filename ".lsp")
        (string-equal filename ".cpcache")
	(string-equal filename ".cache")
	(string-equal filename ".clj-kondo")
        ))
  (add-to-list 'treemacs-ignored-file-predicates 'custom-treemacs-ignore)

  )

(use-package treemacs-projectile
  :after treemacs projectile)
