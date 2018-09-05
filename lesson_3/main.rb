require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'interface/int'

int = Interface.new

loop do
  int.user = nil
  int.main_menu
  int.new_station if int.user == 1
  int.new_train if int.user == 2
  int.new_route if int.user == 3
  return if int.user == 0
end
