Squid Config
============
A utility that rotates the pallette of polybar and i3 based on desktop background.

For out of the box use, requires nitrogen, ruby, sed, and grep.

## Set Up
Copy and separate into sections based on functionality your polybar/i3 configurations to the `conf` directories in `Barcycle` and `i3cycle`,
and make sure `configPaths.sh` is pointed to the correct locations. I have my own config files in there as examples.

Fill `assets` in the project's root directory with all your wallpapers, and for each wallpaper pick three colors:
`master-background`, `master-foreground`, and `master-alternate`.

The philisophy to follow here is:
  - `master-background` corresponds to polybar's background color, also the color of inactive windows in i3,
  - `master-foreground` corresponds to the color of your font in polybar and i3
  - `master-alternate` corresponds to your highlight color - eg, the active container in 3 or active workspace on a polybar ws module

Place the chosen colors in `PalletteMap.rb` as key value pairs structured as `{ wallpapername.extension, [ master-background, master-foreground, master-alternate ] }`.

Any background that lives in the `assets` folder of the root directory MUST have a corresponding entry in
`PalletteMap.rb`, this is how the program determines what colors to set on polybar and i3 when switching the background.

## Usage
Invoke `execute.sh` after following the set up steps above.  You can pick a specific
color pallette and background by supplying the filename of an image in the `assets`
directory and it will switch to that one specifically.
