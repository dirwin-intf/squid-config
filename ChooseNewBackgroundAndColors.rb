require './PalletteMap.rb'
require './Barcycle/ReplaceColors.rb'
require './i3cycle/ReplaceColors.rb'

# set constants
currentWallpaperFile = "#{__dir__}/currentWallpaper.txt"
assets = "#{__dir__}/assets"

if ARGV[0] != nil and PalletteMap::palletteMap[ARGV[0]] != nil
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

ReplacePolybarColors.replaceColors(newWallpaper)
ReplaceI3Colors.replaceColors(newWallpaper)

# write the current wallpaper to file for posterity
command = "echo \"#{newWallpaper}\" > #{currentWallpaperFile}"
`#{command}`

# echo the path to the new wallpaper so that nitrogen can select it
newWallpaperPath = "#{__dir__}/assets/#{newWallpaper}"
puts newWallpaperPath
