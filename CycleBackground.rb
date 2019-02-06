# set constants
polybarConfig = "~/.config/polybar/config"
currentWallpaperFile = "#{__dir__}/currentWallpaper.txt"
assets = "#{__dir__}/assets"

# key value pairs in the form of { filename, [backgroundColor, fontColor, highlightColor] }
# this is used when invoking sed later
palletteMap = {
  "deadcells_1.png" =>        ["#111D0D", "#C4C0C2", "#2C4866"],
  "deadcells_3.png" =>        ["#0C0F2D", "#BB83A0", "#3D2C50"],
  "deadcells_4.jpg" =>        ["#141B2E", "#EAE1D1", "#402B70"],
  "deadcells_5.png" =>        ["#221720", "#B6AB95", "#4C304B"],
  "secret_island.png" =>      ["#322439", "#FBCFAA", "#7B658D"],
  "city_bridge_view.jpg" =>   ["#3B4C56", "#F4F4F6", "#ED9F9D"],
  "autumn_scene.png" =>       ["#292F4E", "#C0B58C", "#4B5669"],
  "blue_view.png" =>          ["#102438", "#EAFDF7", "#226375"],
  "hyperlight_drifter.png" => ["#2A1F31", "#BBC7C9", "#5F2B53"],
  "snowy_forest.png" =>       ["#13102F", "#9DBCDD", "#2D4270"],
  "great_wave.png" =>         ["#070B1A", "#D7C9AA", "#535D5C"],
  "master_sword.png" =>       ["#1C212F", "#9ECAA4", "#486363"],
  "fighting_sleep.png" =>     ["#271F37", "#EAE7EB", "#8C4E6C"]
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
