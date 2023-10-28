;; https://www.emacswiki.org/emacs/WindMove
;; lets me move between windows with <S>-<left|up|right|down>
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(setq  xref-auto-jump-to-first-xref t)
(setq xref-prompt-for-identifier nil) ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Identifier-Search.html

;; code folding: https://github.com/gregsexton/origami.el
(use-package origami
  :config
   (define-key origami-mode-map (kbd "s-o o") 'origami-open-node)
   (define-key origami-mode-map (kbd "s-o s-o") 'origami-open-node)
   (define-key origami-mode-map (kbd "s-o c") 'origami-close-node)
   (define-key origami-mode-map (kbd "s-o s-c") 'origami-close-node)
   :init
  (global-origami-mode t))

;; so I can navigate through my errors
;; https://github.com/flycheck/flycheck
(use-package flycheck
  :bind
  ("s-<f2>" . flycheck-next-error))

