;;; Set defaults for emacs' internal IRC client.
(require 'erc)
(setq erc-user-full-name "F B")
(setq erc-modules (quote (completion
                          keep-place
                          list
                          hl-nicks
                          completion
                          netsplit
                          fill
                          button
                          match
                          track
                          readonly
                          networks
                          ring
                          autojoin
                          noncommands
                          irccontrols
                          move-to-prompt
                          stamp
                          menu
                          list)))
