Squid Config Barcycle
=====================
A utility that rotates the pallette of your polybar (assuming your polybar
only uses three main colors).

Requires nitrogen, ruby, sed, and grep. Doesn't make sense to use without polybar.

##Set Up
Create in the colors section of your polybar the following three colors:
  - `master-background`
  - `master-foreground`
  - `master-alternate`

`master-background` should correspond to the bar's background color, `master-foreground`
should correspond to the color you want the text on your bar to be, and `master-alternate`
is used for highlighting - for example, denoting which workspace you have active

Make sure to update your bars and modules to use these colors.

Any background that lives in the `assets` folder MUST have a corresponding entry in the
palletteMap in `CycleBackground.rb`, this is how the program determines what colors to
set on your polybar when switching the background.

Make sure `CycleBackground.rb` is pointed at your polybar config.

##Usage
Invoke `execute.sh` after following the set up steps above.  You can pick a specific
color pallette and background by supplying the filename of an image in the `assets`
directory and it will switch to that one specifically.
