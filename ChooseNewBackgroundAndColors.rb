# set constants
polybarConfig = "~/.config/polybar/config"
currentWallpaperFile = "#{__dir__}/currentWallpaper.txt"
assets = "#{__dir__}/assets"

# key value pairs in the form of { filename, [backgroundColor, fontColor, highlightColor] }
# this is used when invoking sed later
palletteMap = {
}

# grab all the old values so we can invoke sed later and replace them
command = "grep -e \"master-background = *\" #{polybarConfig}"
oldBackground = `#{command}`.chomp

command = "grep -e \"master-foreground = *\" #{polybarConfig}"
oldForeground = `#{command}`.chomp

command = "grep -e \"master-alternate = *\" #{polybarConfig}"
oldAlternate = `#{command}`.chomp

if ARGV[0] != nil and palletteMap[ARGV[0]] != nil
  newWallpaper = ARGV[0]
else
  # grab the current wallpaper so we can make sure the new one that is
  # randomly chosen isn't the same
  command = "head -1 #{currentWallpaperFile}"
  currentWallpaper = `#{command}`.chomp

  loop do
    command = "ls #{assets} | sort -R | tail -1"
    newWallpaper = `#{command}`.chomp

    break if !newWallpaper.eql?(currentWallpaper)
  end
end

# write the current wallpaper to file for posterity
command = "echo \"#{newWallpaper}\" > #{currentWallpaperFile}"
`#{command}`

# build up our replacement sed expressions
newBackground = "master-background = " + palletteMap[newWallpaper][0]
newForeground = "master-foreground = " + palletteMap[newWallpaper][1]
newAlternate = "master-alternate = " + palletteMap[newWallpaper][2]

command = "sed -i -e \"s/#{oldBackground}/#{newBackground}/g\" "\
               + "-e \"s/#{oldForeground}/#{newForeground}/g\" "\
               + "-e \"s/#{oldAlternate}/#{newAlternate}/g\" #{polybarConfig}"
`#{command}`

# echo the path to the new wallpaper so that nitrogen can select it
newWallpaperPath = "#{__dir__}/assets/#{newWallpaper}"
puts newWallpaperPath
