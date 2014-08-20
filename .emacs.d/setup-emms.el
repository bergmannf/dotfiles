(require 'emms)

(emms-standard)

(emms-default-players)

(require 'emms-player-mpd)
(setq emms-player-mpd-server-name "127.0.0.1")
(setq emms-player-mpd-server-port "6600")
(add-to-list 'emms-info-functions 'emms-info-mpd)
(add-to-list 'emms-player-list 'emms-player-mpd)

(require 'emms-browser)
