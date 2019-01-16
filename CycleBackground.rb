require 'pry'

polybarConfig = "~/.config/polybar/config"
currentWallpaperFile = "#{__dir__}/currentWallpaper.txt"
assets = "#{__dir__}/assets"

map = {
  "deadcells_1.png" => ["#111D0D", "#98FFDE", "#2C4866"],
  "deadcells_2.png" => ["#0B101A", "#98BED0", "#133A4E"],
  "deadcells_3.png" => ["#0C0F2D", "#E58BA1", "#3D2C50"],
  "deadcells_4.jpg" => ["#141B2E", "#EAE1D1", "#292147"],
  "deadcells_5.png" => ["#221720", "#B6AB95", "#4C304B"],
  "hollowknight_1.jpg" => ["#050A25", "#F1F2E6", "#0A4151"],
  "hollowknight_2.jpg" => ["#181F39", "#C8BBC4", "#293952"],
  "hollowknight_3.jpg" => ["#0F101F", "#FFFFFF", "#26364D"]
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

gateKeeper = newWallpaper.equal?(currentWallpaper)
while(gateKeeper) do
  newWallpaper = `#{command}`.chomp
  gateKeeper = newWallpaper.equal?(currentWallpaper)
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
