class Station
  attr_reader :name

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
    @stations = [starting_station.name, end_station.name]
  end

  def add_station(new_station)
    @stations << new_station.name
    @stations[-1], @stations[-2] = @stations[-2], @stations[-1]
  end

  def delete_station(name)
    @stations.delete(name)
  end
end

class Train
  attr_reader :train_number, :type, :wagons_quantity
  attr_accessor :speed

  def initialize(train_number, type, wagons_quantity)
    @train_number = train_number
    @type = type
    @wagons_quantity = wagons_quantity
    @speed = 0
  end

  def wagon(type)
    if type = "-" && @wagons_quantity != 0
      @wagons_quantity -= 1 if @speed == 0
    elsif type = "+" && @speed == 0
      @wagons_quantity += 1 if @speed == 0
    end
  end
end
