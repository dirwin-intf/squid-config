require_relative '../PalletteMap.rb'

module ReplaceI3Colors
  def self.replaceColors newWallpaper
    colorFilePath = "#{__dir__}/conf/color"

    # grab the old values for
    # client.focused, client.focused_inactive, and client.unfocused
    command = "grep -e \"client.focused #*\" #{colorFilePath}"
    oldFocused = `#{command}`.chomp
    oldFocusedArr = oldFocused.split(' ');

    command = "grep -e \"client.focused_inactive #*\" #{colorFilePath}"
    oldInactiveFocused = `#{command}`.chomp
    oldInactiveFocusedArr = oldInactiveFocused.split(' ');

    command = "grep -e \"client.unfocused #*\" #{colorFilePath}"
    oldUnfocused = `#{command}`.chomp
    oldUnfocusedArr = oldUnfocused.split(' ');

    masterBackground = PalletteMap.palletteMap[newWallpaper][0]
    masterForeground = PalletteMap.palletteMap[newWallpaper][1]
    masterAlternate = PalletteMap.palletteMap[newWallpaper][2]

    # replace the background and text, of focused and focused_inactive
    oldFocusedArr[2] = masterAlternate
    oldFocusedArr[3] = masterForeground

    # replace the background and text of focused_inactive
    oldInactiveFocusedArr[2] = masterBackground
    oldInactiveFocusedArr[3] = masterForeground

    # replace the background and text of unfocused
    oldUnfocusedArr[2] = masterBackground
    oldUnfocusedArr[3] = masterForeground

    # create the new values to be used in sed
    newFocused = oldFocusedArr.join(' ')
    newInactiveFocused = oldInactiveFocusedArr.join(' ')
    newUnfocused = oldUnfocusedArr.join(' ')

    command = "sed -i -e \"s/#{oldFocused}/#{newFocused}/g\" "\
      + "-e \"s/#{oldInactiveFocused}/#{newInactiveFocused}/g\" "\
      + "-e \"s/#{oldUnfocused}/#{newUnfocused}/g\" #{colorFilePath}"
    `#{command}`
  end
end
