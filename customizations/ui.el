;; These customizations change the way emacs looks and disable/enable
;; some user interface elements. Some useful customizations are
;; commented out, and begin with the line "CUSTOMIZE". These are more
;; a matter of preference and may require some fiddling to match your
;; preferences

(tooltip-mode -1)                 ;; disable tooltips
(tool-bar-mode -1)                ;; the toolbar is pretty ugly
(scroll-bar-mode -1)              ;; disable visible scrollbar
(blink-cursor-mode 0)             ;; turn off blinking cursor. distracting!
(setq create-lockfiles nil)       ;; no need for ~ files when editing
(fset 'yes-or-no-p 'y-or-n-p)     ;; changes all yes/no questions to y/n type
(setq inhibit-startup-message t)  ;; go straight to scratch buffer on startup
(setq ring-bell-function 'ignore) ;; turn off audible bell
(setq xref-prompt-for-identifier nil) ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Identifier-Search.html
(global-display-line-numbers-mode 1)

;; show full path in title bar
(setq-default frame-title-format "%b (%f)")

;; initial frame height and width
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(width . 100))

;; on a Mac, don't pop up font menu
(when (string-equal system-type "darwin") 'ok
  (global-set-key (kbd "s-t") '(lambda () (interactive))))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

;; CUSTOMIZE

;; You can uncomment this to remove the graphical toolbar at the top. After
;; awhile, you won't need the toolbar.
;; (tool-bar-mode -1)

(use-package rainbow-delimiters
  :custom-face (rainbow-delimiters-depth-1-face ((t :foreground "#c66" ))) ; red
  :custom-face (rainbow-delimiters-depth-2-face ((t :foreground "#6c6" ))) ; green
  :custom-face (rainbow-delimiters-depth-3-face ((t :foreground "#69f" ))) ; blue
  :custom-face (rainbow-delimiters-depth-4-face ((t :foreground "#cc6" ))) ; yellow
  :custom-face (rainbow-delimiters-depth-5-face ((t :foreground "#6cc" ))) ; cyan
  :custom-face (rainbow-delimiters-depth-6-face ((t :foreground "#c6c" ))) ; magenta
  :custom-face (rainbow-delimiters-depth-7-face ((t :foreground "#ccc" ))) ; light gray
  :custom-face (rainbow-delimiters-depth-8-face ((t :foreground "#999" ))) ; medium gray
  :custom-face (rainbow-delimiters-depth-9-face ((t :foreground "#666" ))) ; darkbpr gray
  :hook
  (prog-mode . rainbow-delimiters-mode)
  )

