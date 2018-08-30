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

  def display
    @stations.each { |st| puts st.name }
  end

  def delete_station(station_name)
      @stations.delete_if { |st| st.name if st.name == station_name }
  end
end

class Train
  attr_reader :wagons_quantity, :type, :train_number
  attr_accessor :speed

  def initialize(train_number, type, wagons_quantity)
    @train_number = train_number
    @type = type
    @wagons_quantity = wagons_quantity
    @speed = 0
  end

  def add_route(route)
    @route = route
    @route.stations[0].trains << self
    @curret_station_index = 0
  end

  def to_next_station
    next_station_index = @curret_station_index + 1

    if @curret_station_index < @route.stations.index(@route.stations.last)
      @route.stations[@curret_station_index].trains.delete(self)
      @route.stations[next_station_index].trains << self
      @curret_station_index = next_station_index
    end
  end

  def to_previous_station
    previous_station_index = @curret_station_index - 1

    if @curret_station_index > 0
      @route.stations[@curret_station_index].trains.delete(self)
      @route.stations[previous_station_index].trains << self
      @curret_station_index = previous_station_index
    end
  end

  def add_wagon
    @wagons_quantity += 1 if @speed == 0
  end

  def remove_wagon
    @wagons_quantity -= 1 if @speed == 0 && @wagons_quantity != 0
  end
end
