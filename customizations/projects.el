;; https://github.com/bbatsov/projectile
;; https://docs.projectile.mx/projectile/usage.html
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)))
