require 'pry'

polybarConfig = "~/.config/polybar/config"
currentWallpaperFile = "#{__dir__}/currentWallpaper.txt"
assets = "#{__dir__}/assets"

map = {
  "deadcells_1.png" => ["#111D0D", "#C4C0C2", "#2C4866"],
  "deadcells_2.png" => ["#0B101A", "#BCDAE3", "#133A4E"],
  "deadcells_3.png" => ["#0C0F2D", "#BB83A0", "#3D2C50"],
  "deadcells_4.jpg" => ["#141B2E", "#EAE1D1", "#402B70"],
  "deadcells_5.png" => ["#221720", "#B6AB95", "#4C304B"],
  "secret_island.png" => ["#322439","#FBCFAA","#7B658D"],
  "city_bridge_view.jpg" => ["#3B4C56", "#F4F4F6", "#ED9F9D"]
}

command = "grep -e \"master-background = *\" #{polybarConfig}"
oldBackground = `#{command}`.chomp

command = "grep -e \"master-foreground = *\" #{polybarConfig}"
oldForeground = `#{command}`.chomp

command = "grep -e \"master-alternate = *\" #{polybarConfig}"
oldAlternate = `#{command}`.chomp

command = "head -1 #{currentWallpaperFile}"
currentWallpaper = `#{command}`.chomp

command = "ls #{assets} | sort -R | tail -1"
newWallpaper = `#{command}`.chomp

while(newWallpaper.eql?(currentWallpaper)) do
  newWallpaper = `#{command}`.chomp
end

command = "echo \"#{newWallpaper}\" > #{currentWallpaperFile}"
`#{command}`

newBackground = "master-background = " + map[newWallpaper][0]
newForeground = "master-foreground = " + map[newWallpaper][1]
newAlternate = "master-alternate = " + map[newWallpaper][2]

command = "sed -i -e \"s/#{oldBackground}/#{newBackground}/g\" "\
               + "-e \"s/#{oldForeground}/#{newForeground}/g\" "\
               + "-e \"s/#{oldAlternate}/#{newAlternate}/g\" #{polybarConfig}"
`#{command}`

newWallpaperPath = "#{__dir__}/assets/#{newWallpaper}"
puts newWallpaperPath
