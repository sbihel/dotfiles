#! /bin/sh

#### Determine size of Terminal
height=`stty  size | awk 'BEGIN {FS = " "} {print $1;}'`
width=`stty  size | awk 'BEGIN {FS = " "} {print $2;}'`

### Display Image / offset with mutt bar
if [[ $OSTYPE != 'linux-gnu' ]]; then
    echo -e "2;3;\n0;1;210;20;$((width*7-250));$((height*14-100));0;0;0;0;$1\n4;\n3;" |  imgcat &
else
    echo -e "2;3;\n0;1;210;20;$((width*7-250));$((height*14-100));0;0;0;0;$1\n4;\n3;" |  /usr/libexec/w3m/w3mimgdisplay &
fi
