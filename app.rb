[
  "./src/models/game.rb",
  "./src/models/player.rb",
  "./util/map_utility.rb",
  "./src/models/map.rb",
  "./src/models/thing.rb",
  "./lib/input_parser.rb",
  "./lib/key_mapper.rb",
  "./lib/window.rb"
].each { |file| require_relative file }

##
# 1) get the "map hash", which is a two-dimensional array of symbols
# the symbols are keys to a global Map Els hash that stores output strings
# - map_utility.rb
map_hash = build_farmhouse

##
# 2) feed the map_hash to the Map class, which generates a two-dimensional
# array of symbols - a "snapshot" or a frame
# map.rb
world_map = Map.new(map_hash)

##
# 3) initialize a key_mapper, which implements the read_char function
key_mapper = KeyMapper.new

##
# 4) initialize a game class with the map and key_mapper
# Dependencies:
#    * map object
#    * key_mapper object
window = Window.new(15, 15)
parser = InputParser.new
game = Game.new(map: world_map, window: window, parser: parser, key_mapper: key_mapper)

##
# 5) initialize some objects for the game world
#
sword = Thing.new("sword", nil, game)
chest = Chest.new("chest", [4, 5], [sword], game)

##
# 6) initialize the player
#
george = Player.new("George", game)

##
# 7) Run the game
#
game.run_game