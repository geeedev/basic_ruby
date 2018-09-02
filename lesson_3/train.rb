class Train
  attr_reader :wagons_quantity, :type, :train_number, :route, :speed

  def initialize(train_number, type, wagons_quantity)
    @train_number = train_number
    @type = type
    @wagons_quantity = wagons_quantity
    @speed = 0
  end

  def stopped?
    @speed.zero?
  end

  def up_speed
    @speed += 50
  end

  def stop
    @speed = 0
  end

  def add_route(route)
    @route = route
    route.stations[0].add_train(self)
    @curret_station_index = 0
  end

  def to_next_station
    if current_station && next_station
      current_station.remove_train(self)
      next_station.add_train(self)
      @curret_station_index += 1
      current_station
    end
  end

  def to_previous_station
    if current_station && previous_station
      current_station.remove_train(self)
      previous_station.add_train(self)
      @curret_station_index -= 1
      current_station
    end
  end

  def current_station
    @route.stations[@curret_station_index] if @curret_station_index
  end

  def next_station
    @route.stations[@curret_station_index + 1] if @curret_station_index
  end

  def previous_station
    if @curret_station_index && @curret_station_index > 0
      @route.stations[@curret_station_index - 1]
    end
  end

  def add_wagon
    @wagons_quantity += 1 if stopped?
  end

  def remove_wagon
    @wagons_quantity -= 1 if stopped? && @wagons_quantity > 0
  end
end
