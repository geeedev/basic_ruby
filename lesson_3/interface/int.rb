class Interface
  attr_accessor :user, :stations, :routes

  def initialize
    @user = nil
    @stations = []
    @routes = []
  end

  def main_menu
    while @user == nil
      puts '
        1. Create a new station
        2. Create a new train
        3. Create a new route
        4. Add station in the route
        0. Exit
      '
      @user = gets.to_i
    end
  end

  def new_station
    print 'Enter obgect_name: '
    obgect_name = gets.chomp
    print 'Enter name station: '
    name_station = gets.chomp
    obgect_name = Station.new(name_station)
    @stations << obgect_name
    puts "Created new station: #{obgect_name.name}"
  end

  def new_train
    print 'Enter train type (passenger or cargo): '
    train_type = gets.chomp
    print 'Enter obgect_name: '
    obgect_name = gets.chomp
    print 'Enter train number: '
    train_number = gets.to_i
      if train_type == 'passenger'
        obgect_name = PassengerTrain.new(train_number)
      elsif train_type == 'cargo'
        obgect_name = CargoTrain.new(train_number)
      else
        puts 'Type error'
      end
    puts "Created new train: #{obgect_name}"
  end

  def new_route
    if @stations.empty?
      puts 'please create stations'
      return
    else
      @stations.each {|st| puts st.name}
    end
    print 'Enter obgect_name: '
    obgect_name = gets.chomp
    print 'Enter starting station: '
    starting_station = gets.chomp
    print 'Enter end station: '
    end_station = gets.chomp
    obgect_name = Route.new(starting_station, end_station)
    @routes << obgect_name
    puts "Created new route: #{obgect_name}"
  end
end
