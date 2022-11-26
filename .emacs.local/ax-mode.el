;;; ax-mode.el --- Major Mode for editing ax source code -*- lexical-binding: t -*-

;; Copyright © 2022 Alex Overstreet
;;
;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the "Software"),
;; to deal in the Software without restriction, including without limitation
;; the rights to use, copy, modify, merge, publish, distribute, sublicense,
;; and/or sell copies of the Software, and to permit persons to whom the
;; Software is furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included
;; in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
;; OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
;; IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
;; DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
;; TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
;; OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(defconst ax-mode-syntax-table
  (with-syntax-table (copy-syntax-table)
    ;; C/C++ style comments
	(modify-syntax-entry ?/ ". 124b")
	(modify-syntax-entry ?* ". 23")
	(modify-syntax-entry ?\n "> b")
    ;; Chars are the same as strings
    (modify-syntax-entry ?' "\"")
    (syntax-table))
  "Syntax table for `ax-mode'.")

(defun ax-types ()
  '("int" "uint" "float" "float64" "string" "rawptr"
    "u8" "u16" "u32" "u64" "s8" "s16" "s32" "s64"
    "ptr-to" "const"))

(defun ax-keywords ()
  '("if" "ifx" "else" "end" "do" "while" "continue" "break" "for"
    "proc" "in" "inline" "return" "no-ret" "call-addr"
    "var" "let" "comptime" "with" "peek" "include"
    "size-of" "type-of" "addr-of" "offset-of" "struct" "enum"))

(defun ax-font-lock-keywords ()
  (list
   ;; `(,(regexp-opt (ax-types) 'symbols) . font-lock-type-face)
   `(,(regexp-opt (ax-keywords) 'symbols) . font-lock-keyword-face)))

(add-hook 'ax-mode-common-hook 'my-ax-mode-common-hook)

;;;###autoload
(define-derived-mode ax-mode prog-mode "ax"
  "Major Mode for editing ax source code."
  :syntax-table ax-mode-syntax-table
  (setq font-lock-defaults '(ax-font-lock-keywords))
  (setq-local comment-start "// "))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.ax\\'" . ax-mode))

(provide 'ax-mode)

;;; ax-mode.el ends here
