((c-mode . ((indent-tabs-mode .  nil)))
 (c++-mode . ((indent-tabs-mode .  nil)))
 (nil . ((flycheck-clang-language-standard . "c++17")
         (flycheck-clang-include-path . ("."
                                         ))
         (whitespace-style . (face tabs tab-mark trailing lines-tail empty))
         (c-file-style . "stroustrup")
         (eval . (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)))
         (eval . (if (boundp 'c-offsets-alist)
                     (add-to-list 'c-offsets-alist '(innamespace . -))))
)))
