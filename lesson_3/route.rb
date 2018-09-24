class Route
  attr_reader :stations

  def initialize(starting_station, end_station)
    @stations = [starting_station, end_station]
  end

  def display
    stations.each_with_index {|station, index| puts "#{index + 1} - #{station.name}"}
  end

  def delete_station(station)
    stations.delete(station)
  end

  def add_station(new_station)
    if stations.include?(new_station)
      puts 'станция уже есть в маршруте'
    else
      stations.insert(-2, new_station)
    end
  end
end
