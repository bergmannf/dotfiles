(require 'ispell)
(add-to-list 'ispell-dictionary-alist '("deutsch-hunspell"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "de_DE"); Dictionary file name
                                              nil
                                              iso-8859-1))

(add-to-list 'ispell-dictionary-alist '("english-hunspell"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "en_US")
                                              nil
                                              iso-8859-1))

(setq ispell-program-name "hunspell"          ; Use hunspell to correct mistakes
      ispell-dictionary   "deutsch-hunspell") ; Default dictionary to use
