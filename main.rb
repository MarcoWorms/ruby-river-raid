require 'gosu'

require_relative 'game_window'
require_relative 'plane'
require_relative 'bullet_manager'
require_relative 'enemy_manager'
require_relative 'wall_manager'
require_relative 'timer'

game_window = Game_window.new()
game_window.show