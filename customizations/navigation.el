;; https://www.emacswiki.org/emacs/WindMove
;; lets me move between windows with <S>-<left|up|right|down>
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(setq  xref-auto-jump-to-first-xref t)
(setq xref-prompt-for-identifier nil) ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Identifier-Search.html

;; code folding: us (hs-minor-mode) instead of origami


;; so I can navigate through my errors
;; https://github.com/flycheck/flycheck
(use-package flycheck
  :bind
  ("s-<f2>" . flycheck-next-error))

