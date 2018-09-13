require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

class Main
  attr_reader :stations, :trains, :routes, :wagons

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def run
    command = get_main_user_command
    while command != 0
      create_station if command == 1
      create_train if command == 2
      create_route if command == 3
      add_station if command == 4
      remove_station if command == 5
      add_route_train if command == 6
      create_wagon if command == 7
      add_wagon if command == 8
      to_next_station if command == 9
      to_previous_station if command == 10
      stations_list if command == 11
      trains_list_in_station if command == 12
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

    1 - create statioon
    2 - create train
    3 - create route
    4 - add station in route
    5 - remove station
    6 - add route in train
    7 - create wagon
    8 - add_wagon
    9 - to_next_station
    10 - to_previous_station
    11 - stations_list
    12 - trains_list_in_station
    0 - exit

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
    print 'Enter train number: '
    train_number = gets.to_i
    trains << Train.new(train_number)
    puts "Train #{train_number} successfully created"
  end

  def create_route
    if stations.empty?
      puts 'Please create stations'
    else
      stations.each { |st| puts st.name }
    end
    puts 'Enter starting station: '
    starting_station = gets.chomp
    puts 'Enter end station: '
    end_station = gets.chomp
    stations.each do |st|
      starting_station = st if st.name == starting_station
      end_station = st if st.name == end_station
    end
    routes << Route.new(starting_station, end_station)
    puts "Route #{starting_station.name} - #{end_station.name} successfully created"
  end

  def add_station
    if routes.empty?
      puts 'please create route'
    else
      puts 'enter index route: '
      routes.each { |ro| ro.display }
      index_route = gets.to_i
      stations.each { |st| puts st.name }
      puts 'enter index station: '
      station_index = gets.to_i
      routes[index_route - 1].add_station(stations[station_index - 1])
    end
  end

  def remove_station
    if routes.empty?
      puts 'please create route'
    else
      #показать маршруты
      routes.each { |ro| ro.display }
      # выбрать маршрут
      puts 'enter index route: '
      route_index = gets.to_i
      # показать станции маршрута
      routes[route_index - 1].display
      # выбрать станцию
      puts 'enter station name: '
      station_name = gets.chomp
      # удалить станцию
      routes[route_index - 1].delete_station(station_name)
    end
  end

  def add_route_train
    # показать список маршрутов
    routes.each { |ro| ro.display }
    # выбрать маршрут
    puts 'enter index route: '
    route_index = gets.to_i
    # показать поезда
    trains.each { |tr| puts tr.train_number }
    # выбрать поезд
    puts 'enter index train: '
    train_index = gets.to_i
    # назначить маршрут поезду
    trains[train_index - 1].add_route(routes[route_index - 1])
  end

  def create_wagon
    puts 'enter wagon type (cargo/passenger): '
    type = gets.chomp
    if type == 'cargo'
      wagons << CargoTrain.new
    elsif type == 'passenger'
      wagons << PassengerTrain.new
    end
  end

  def add_wagon
    # показать поезда
    trains.each { |tr| puts tr.train_number }
    # выбрать поезд
    puts 'enter train index: '
    train_index = gets.to_i
    #показать вагоны
    wagons.each { |w| puts w.type}
    #выбрать вагон
    puts 'enter wagon index: '
    wagon_index = gets.to_i
    # добавить вагон
    trains[train_index - 1].add_wagon(wagons[wagon_index - 1])
  end

  def to_next_station
    # показать поезда
    trains.each { |tr| puts tr.train_number }
    # выбрать поезд
    puts 'enter index train: '
    train_index = gets.to_i
    # переместить вперд
    trains[train_index - 1].to_next_station
  end

  def to_previous_station
    # показать поезда
    trains.each { |tr| puts tr.train_number }
    # выбрать поезд
    puts 'enter index train: '
    train_index = gets.to_i
    # переместить назад
    trains[train_index - 1].to_previous_station
  end

  def stations_list
    # показать список  станций
    stations.each { |st| puts st.name }
  end

  def trains_list_in_station
    # показать список  станций
    stations.each { |st| puts st.name }
    # выбрать станцию
    puts 'enter index station: '
    station_index = gets.to_i
    puts 'enter train type (passenger/cargo): '
    type = gets.chomp
    # показать список поездов на станции
    stations[station_index - 1].display(type)
  end
end

main = Main.new

main.run
