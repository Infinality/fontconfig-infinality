# Should the Xft settings be set globally by this script?  (true/false)
SET_XFT_GLOBAL=false

# Experimental emboldening values for OSX mode
export INFINALITY_FT_GLOBAL_EMBOLDEN_X_VALUE=0
export INFINALITY_FT_GLOBAL_EMBOLDEN_Y_VALUE=0
export INFINALITY_FT_BOLD_EMBOLDEN_X_VALUE=0     # This one seems to crash at anything other than 0
export INFINALITY_FT_BOLD_EMBOLDEN_Y_VALUE=0

source xft.sh
source rendering-style.sh
