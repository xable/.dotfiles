#!/bin/bash
9menu -label "Menu"\
      -bg "#14151F" \
      -fg "#7a88a3"\
      -font "-xos4-terminus-medium-r-normal--12-120-72-72-c-60-iso10646-1"\
      -popup\
      -teleport\
      "BROWSER":"firefox"\
      "FILE":"urxvt -e fff"\
      "NVIM":"urxvt -e nvim"\
      "RSS":"urxvt -g 120x24 -e newsboat"\
      "MUSIC":"urxvt -e ncmpcpp"\
      "CAVA":"urxvt -e cava"\
      "TORRENT":"urxvt -g 110x20 -e rtorrent"\
      "IRC":"urxvt -e weechat"\
      "LOCK":"lock"\
