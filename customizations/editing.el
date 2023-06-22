(use-package company
  :init
  (setq global-company-mode 1)
  )

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq make-backup-files nil) ;; TODO: Braucht's das noch?

;; Highlights matching parenthesis
(show-paren-mode 1)

;; https://github.com/magnars/expand-region.el
(use-package expand-region
  :bind ("C-=" . er/expand-region))


;; https://github.com/wyuenho/move-dup
;; M-<up|down> moves a line, C-M-<up|down> copies a line
(use-package move-dup)
(global-move-dup-mode)

;; https://github.com/auto-complete/auto-complete
(use-package auto-complete
  :config
  (auto-complete-mode 1)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  )

(global-auto-revert-mode 1) ;; auto-reloads when file has changed on disc

;; overwrite selected text
(delete-selection-mode t)
