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
  (setq treemacs-tag-follow-delay 1) ;; so I see the current file in treemacs after 1 sec
  (treemacs-filewatch-mode t) ;; so filechanges (e.g. "save") are shown in treemacs
  
  ;; 'simple won't work with treemacs-hide-gitignored-files-mode, see https://github.com/Alexander-Miller/treemacs/issues/962
  (treemacs-git-mode 'extended) ;; so changed files have a different color.
  (treemacs-hide-gitignored-files-mode t)
  :bind
  (:map global-map
	("s-1" . treemacs)
	("s-0" . treemacs-select-window)
	)
  (:map local-function-key-map
	("s-b" . treemacs-bookmark)
	("s-<left>" . treemacs-goto-parent-node)
        )
)

(use-package treemacs-projectile
  :after treemacs projectile)

(use-package yasnippet-snippets) ;; https://github.com/AndreaCrotti/yasnippet-snippets
