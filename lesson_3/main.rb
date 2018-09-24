require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

class Main
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def run
    command = get_main_user_command
    while command != 0
      create_station if command == 1
      create_train if command == 2
      create_route if command == 3
      add_station_in_route if command == 4
      remove_station_in_route if command == 5
      add_route_in_train if command == 6
      add_wagon_in_train if command == 7
      remove_wagon_in_train if command == 8
      send_to_next_station if command == 9
      send_to_previous_station if command == 10
      puts '======================================'
      command = get_main_user_command
    end
  end

  def get_main_user_command
    main_menu
    puts 'Enter number of coomand you want to execute'
    gets.to_i
  end

  def main_menu
    text = <<-MAIN_MANU
    Main menu commands

    1 - Create statioon
    2 - Create train
    3 - Create route
    4 - Add station in route
    5 - Remove station in route
    6 - Add route in train
    7 - Add wagon in train
    8 - Remove wagon in train
    9 - Send train to next station
   10 - Send train to previous station
    0 - Exit

    MAIN_MANU

    puts text
  end

  def create_station
    print 'Enter station name: '
    station_name = gets.chomp
    stations << Station.new(station_name)
    puts "Station #{station_name} successfully created"
  end

  def create_train
    ['cargo', 'passenger'].each_with_index {|type, index| puts "#{index + 1} - #{type}"}
    puts 'Enter train type index: '
    train_type_index = gets.to_i
    puts 'Enter train number'
    train_number = gets.to_i
    if train_type_index == 1
      trains << CargoTrain.new(train_number)
      puts "Cargo train - #{train_number} successfully created"
    elsif train_type_index == 2
      trains << PassengerTrain.new(train_number)
      puts "Passenger train - #{train_number} successfully created"
    else
      puts 'No train type with number'
    end
  end

  def create_route
    if stations.empty?
      puts 'Please create stations'
    else
      puts 'Starting station: '
      starting_station = select_station
      puts 'End station: '
      end_station = select_station
      routes << Route.new(starting_station, end_station)
      puts "Route #{starting_station.name} - #{end_station.name} successfully created"
    end
  end

  def add_station_in_route
    route = select_route
    station = select_station
    return unless route && station
    route.add_station(station)
    route.display
  end

  def remove_station_in_route
    route = select_route
    station = select_station_in_route(route)
    route.delete_station(station)
    route.display
  end

  def add_route_in_train
    train = select_train
    route = select_route
    train.add_route(route)
  end

  def add_wagon_in_train
    train = select_train
    if train.type == 'cargo'
      train.add_wagon(CargoWagon.new)
    elsif train.type == 'passenger'
      train.add_wagon(PassengerWagon.new)
    else
      puts 'improper type'
    end
    puts "Wagon successfully added: #{train.wagons.size}"
  end

  def remove_wagon_in_train
    train = select_train
    if train.wagons.empty?
      puts 'You have no wagons'
    else
      train.remove_wagon
      puts "Wagon successfully removed: #{train.wagons.size}"
    end
  end

  def send_to_next_station
    train = select_train
    if train.route.empty?
      puts 'You have no route'
    else
      train.to_next_station
      puts train.current_station
    end
  end

  def send_to_previous_station
    train = select_train
    if train.route.empty?
      puts 'You have no route'
    else
      train.to_previous_station
      puts train.current_station
    end
  end

  def select_wagon_in_train(train)
    if train.wagons.empty?
      puts 'You have no wagons'
    else
      train.wagons.each_with_index { |wagon, index| puts "#{index + 1} - #{wagon.type}" }
      puts 'Enter wagon index: '
      wagon_index = gets.to_i
      if wagon_index <= 0 || wagon_index > train.wagons.size
        puts 'No wagon with number'
      else
        train.wagons[wagon_index - 1]
      end
    end
  end

  def select_wagon
    if wagons.empty?
      puts 'You have no wagons'
    else
      wagons.each_with_index { |wagon, index| puts "#{index + 1} - #{wagon.type}" }
      puts 'Enter wagon index: '
      wagon_index = gets.to_i
      if wagon_index <= 0 || wagon_index > wagons.size
        puts 'No wagon with number'
      else
        wagons[wagon_index - 1]
      end
    end
  end

  def select_train
    if trains.empty?
      puts 'You have no trains'
    else
      trains.each_with_index { |train, index| puts "#{index + 1} - Number: #{train.train_number} type: #{train.type} wagons: #{train.wagons.size}" }
      puts 'Enter train index: '
      train_index = gets.to_i
      if train_index <= 0 || train_index > trains.size
        puts "No train with number - #{train_index}"
      else
        trains[train_index - 1]
      end
    end
  end

  def select_station_in_route(route)
    if route.stations.empty?
      puts 'You have no stations'
    else
      route.display
      puts 'Enter station index: '
      station_index = gets.to_i
      if station_index <= 0 || station_index > stations.size
        puts "No station with number - #{station_index}"
      else
        route.stations[station_index - 1]
      end
    end
  end

  def select_route
    if routes.empty?
      puts 'You have no routs'
    else
      routes.each_with_index {|route, index| puts "#{index + 1} - #{route}"}
      puts 'Enter route index: '
      route_index = gets.to_i
      if route_index <= 0 || route_index > routes.size
        puts "No route with number - #{route_index}"
      else
        routes[route_index - 1]
      end
    end
  end

  def select_station
    if stations.empty?
      puts 'You have no stations'
    else
      stations.e`ach_with_index {|station, index| puts "#{index + 1} - #{station.name}"}
      puts 'Enter station index: '
      station_index = gets.to_i
      if station_index <= 0 || station_index > stations.size
        puts "No station with number - #{station_index}"
      else
        stations[station_index - 1]
      end
    end
  end
end

main = Main.new

main.run
