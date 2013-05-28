################## XFT SETTINGS ######################

# XFT settings are like a red-headed stepchild that should be beaten severely.
# These only affect legacy programs, and *parts* of some modern programs like
# google-chrome.  We only deal with these settings because we have to, otherwise
# crap will slip by.  I recommend using hintslight and autohint as the defaults
# normally in /etc/fonts/.  The reason hintfull and autohint:0 is needed here
# because otherwise some programs will occassionally request slight hinting for
# a truetype font. When a program does this, Freetype automatically uses the
# autohinter, when you may actually want it to be rendered with the TT hinter,
# (if specified in /etc/fonts/).  So setting this to hintfull guarantees that the
# TT font will be rendered with the TT hinter (assuming it is specified in
# /etc/fonts/ to be rendered that way.)  For TT fonts that you want
# rendered with autohint, specifiying that in the /etc/fonts/
# should be enough.  But you might think that by setting this to hintfull
# that it's going to use Freetype's full autohinting (which we *completely*
# avoid) for fonts you want autohinted.  This is where
# INFINALITY_FT_AUTOFIT_FORCE_SLIGHT_HINTING comes in.  It tells freetype to
# use slight hinting on fonts set for autohinting, even if the program requests
# full autohinting.  Freetype's full hinting only looks OK under certain
# circumstances.  The goal of infinality is to make infinality hinting look
# good all the time.


XFT_SETTINGS="
Xft.antialias:  1
Xft.autohint:   0
Xft.dpi:        96
Xft.hinting:    1
Xft.hintstyle:  hintfull
Xft.lcdfilter:  lcddefault
Xft.rgba:       rgb
"

if [ "$SET_XFT_GLOBAL" = "true" ]; then
  echo "$XFT_SETTINGS" | xrdb -merge > /dev/null 2>&1
fi
