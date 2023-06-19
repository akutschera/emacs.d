;; https://github.com/bbatsov/projectile
;; https://docs.projectile.mx/projectile/usage.html
(use-package projectile
  :init
  (projectile-mode +1)
  :config
  (setq projectile-create-missing-test-files 1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)))
