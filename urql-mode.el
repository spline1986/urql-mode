(setq urql-highlights
      '(("#%.+\\$\\|#.+\\$\\|0x[0-9a-z]\\{6,8\\}\\|[0-9]+" . font-lock-constant-face)
		("textcolor\\|style_dos_\\(textcolor\\|filleol\\|buttoncolor\\|cursorcolor\\)\\|tokens_delim\\|inv_\\|count_\\|instr_leave_spc\\|char\\|urq_delay\\|urq_coding\\|current_loc\\|previous_loc\\|clsscr\\|hide_phantoms\\|last_btn_caption\\|fp_prec\\|textpane_\\(left\\|top\\|right\\|bottom\\|width\\)\\|\\(text\\|btn\\|btntxt\\)align\\|textfont\\|gametitle\\|hide_\\(btn\\|link\\)_echo\\|linkh?color\\|menu_\\(textfont\\|bgcolor\\|bordercolor\\|textcolor\\|hindent\\|vindent\\|selectioncolor\\|seltextcolor\\|disabledcolor\\)\\|\\(b\\|l\\|decor_.+_\\)menualign\\|fp_filename\\|%.+" . font-lock-variable-name-face)
		("decor_.+_\\(x\\|y\\|z\\|color\\|linkcolor\\|linkhcolor\\|hide\\|enabled\\|target\\|text\\|align\\|width\\|height\\|hotx\\|hoty\\|flipx\\|flipy\\|angle\\|rotspeed\\|scale\\|frame\\|anispeed\\|anitype\\|script\\|linespacing\\|paraspacing\\)" . font-lock-variable-name-face)
		("end\\|^:.+$\\|\".*\"" . font-lock-doc-face)
		("proc\\|pln\\|println\\|print\\|fpln\\|fprint\\|fprintln\\|fp\\|newfile\\|btn\\|goto\\|inv[\\+|-]\\|if\\|else\\|then\\|\\(inv\\|per\\)kill\\|play\\|loop\\|stop\\|voice\\|fademusic\\|music\\|instr\\|input\\|include\\|pause\\|anykey\\|tokens\\|save\\|clsb?\\|and\\|not\\|or\\|forget_procs\\|rnd\\|decor\\(add\\|mov\\|col\\|rot\\|del\\|scl\\|scr\\)\\|&\\|_\\|p" . font-lock-function-name-face)
		("mov\\|mvr\\|movx\\|mvrx\\|pau\\|col\\|colx\\|ang\\|rot\\|rotx\\|rsp\\|scl\\|sclx\\|rst\\|del" . font-lock-function-name-face)
		(";.*$" . font-lock-comment-face)
		("\\[\\[.+|?.+\\]\\]\\|text\\|rect\\|image\\|animation\\|gif\\|textbutton\\|imgbutton\\|clickarea" . font-lock-type-face)))

(define-derived-mode urql-mode fundamental-mode "urql"
  "major mode for editing urq language code."
  (setq font-lock-defaults '(urql-highlights)))

(defun case-insensitive-advice ()
  (set (make-local-variable 'font-lock-keywords-case-fold-search) t))
(advice-add 'urql-mode :after #'case-insensitive-advice)

(add-to-list 'auto-mode-alist '("\\.qst$" . urql-mode))
(provide 'urql-mode)
