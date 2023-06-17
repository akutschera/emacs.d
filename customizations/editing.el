
(use-package company
  :init
  (setq global-company-mode 1)
  )

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq make-backup-files nil) ;; TODO: Braucht's das noch?
