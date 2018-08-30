class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def show_trains(type = nil)
    selected_trains =
      if ['passenger', 'freight'].include?(type)
        @trains.select { |t| t.type == type }
      else
        @trains
      end
    selected_trains.each {|tr| puts "#{tr.train_number}, #{tr.type}, #{tr.wagons_quantity}"}
  end
end

class Route
  attr_accessor :stations

  def initialize(starting_station, end_station)
    @stations = [starting_station, end_station]
  end

  def add_station(new_station)
    @stations.insert(-2, new_station)
  end

  def show_route
    @stations.each { |st| puts st.name }
  end

  def delete_station(name_station)
      @stations.delete_if { |st| st.name if st.name == name_station }
  end
end

class Train
  attr_reader :train_number, :type, :wagons_quantity, :stations, :current_station, :next_station, :previous_station
  attr_accessor :speed

  def initialize(train_number, type, wagons_quantity)
    @train_number = train_number
    @type = type
    @wagons_quantity = wagons_quantity
    @speed = 0
    @stations = []
  end

  def add_route(route)
    route.stations.each { |st| @stations << st }
    @current_station = @stations[0]
    @current_station.trains << self
  end

  def send(command = 'next')
    @next_station_index = @stations.index(@current_station) + 1 #1
    @previous_station_index = @stations.index(@current_station) - 1

      if command == 'next' && @next_station_index < @stations.index(@stations.last) - 1
        @next_station = @stations[@next_station_index]
        @current_station.trains.delete(self)
        @next_station.trains << self
        @current_station = @next_station
      elsif command == 'previous' && @previous_station_index >= 0
        @previous_station_index = @stations.index(@current_station) - 1
        @previous_station = @stations[@previous_station_index]
        @current_station.trains.delete(self)
        @previous_station.trains << self
        @current_station = @previous_station
      end
  end

  def wagon(type)
    if type = "-" && @wagons_quantity != 0
      @wagons_quantity -= 1 if @speed == 0
    elsif type = "+" && @speed == 0
      @wagons_quantity += 1 if @speed == 0
    end
  end
end
