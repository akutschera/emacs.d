(use-package company
  :config
  (global-company-mode)
  )

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq make-backup-files nil) ;; TODO: Braucht's das noch?
(setq kill-whole-line t) ;; kills newline, too and all the indent of the next line

;; Highlights matching parenthesis
(show-paren-mode 1)

;; https://github.com/magnars/expand-region.el
(use-package expand-region
  :bind ("C-=" . er/expand-region))


;; https://github.com/wyuenho/move-dup
;; s-<up|down> moves a line, C-M-<up|down> copies a line
(use-package move-dup
  :bind (("s-<up>"   . move-dup-move-lines-up)
         ("C-M-<up>" . move-dup-duplicate-up)
         ("s-<down>"   . move-dup-move-lines-down)
         ("C-M-<down>" . move-dup-duplicate-down)))

;; https://github.com/auto-complete/auto-complete
(use-package auto-complete
  ;; :config
  ;; (auto-complete-mode 1)
  ;; (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  )


(global-auto-revert-mode 1) ;; auto-reloads when file has changed on disc

;; overwrite selected text
(delete-selection-mode t)

;; Multi cursors https://github.com/magnars/multiple-cursors.el
(use-package multiple-cursors)
(global-set-key (kbd "s-j") 'mc/mark-next-like-this)
(global-set-key (kbd "s-J") 'mc/mark-previous-like-this)
