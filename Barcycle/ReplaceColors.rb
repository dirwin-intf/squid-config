require_relative '../PalletteMap.rb'

module ReplacePolybarColors
  def self.replaceColors newWallpaper
    colorFilePath = "#{__dir__}/conf/color"

    # grab all the old values so we can invoke sed later and replace them
    command = "grep -e \"master-background = *\" #{colorFilePath}"
    oldBackground = `#{command}`.chomp

    command = "grep -e \"master-foreground = *\" #{colorFilePath}"
    oldForeground = `#{command}`.chomp

    command = "grep -e \"master-alternate = *\" #{colorFilePath}"
    oldAlternate = `#{command}`.chomp

    # build up our replacement sed expressions
    newBackground = "master-background = " + PalletteMap.palletteMap[newWallpaper][0]
    newForeground = "master-foreground = " + PalletteMap.palletteMap[newWallpaper][1]
    newAlternate = "master-alternate = " + PalletteMap.palletteMap[newWallpaper][2]

    command = "sed -i -e \"s/#{oldBackground}/#{newBackground}/g\" "\
      + "-e \"s/#{oldForeground}/#{newForeground}/g\" "\
      + "-e \"s/#{oldAlternate}/#{newAlternate}/g\" #{colorFilePath}"
    `#{command}`
  end
end
