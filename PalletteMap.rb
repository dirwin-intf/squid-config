module PalletteMap
  # key value pairs in the form of { filename, [backgroundColor, fontColor, highlightColor] }
  # this is used when invoking sed later
  def self.palletteMap
    {
      "deadcells_3.png" =>        ["#0C0F2D", "#E9E7DA", "#514397"],
      "deadcells_4.jpg" =>        ["#141B2E", "#EAE1D1", "#402B70"],
      "deadcells_5.png" =>        ["#221720", "#B6AB95", "#4C304B"],
      "secret_island.png" =>      ["#322439", "#FBCFAA", "#7B658D"],
      "city_bridge_view.jpg" =>   ["#3B4C56", "#F4F4F6", "#ED9F9D"],
      "autumn_scene.png" =>       ["#292F4E", "#C0B58C", "#4B5669"],
      "blue_view.png" =>          ["#102438", "#EAFDF7", "#226375"],
      "hyperlight_drifter.png" => ["#2A1F31", "#BBC7C9", "#254B6E"],
      "snowy_forest.png" =>       ["#13102F", "#9DBCDD", "#2D4270"],
      "great_wave.png" =>         ["#070B1A", "#D7C9AA", "#535D5C"],
      "fighting_sleep.png" =>     ["#271F37", "#EAE7EB", "#8C4E6C"],
      "dock.jpg" =>               ["#343A53", "#F0E9D7", "#2D989C"],
      "overgrown_arena.png" =>    ["#22262E", "#C5B585", "#5D7333"],
      "dragons_keep.png" =>       ["#291508", "#FFF396", "#963A09"],
      "farm.png" =>               ["#401212", "#FDEE91", "#6D4A0D"],
      "lonely_day.png" =>         ["#242237", "#FFF5D6", "#6F6790"]
    }
  end
end
