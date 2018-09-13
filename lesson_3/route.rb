class Route
  attr_reader :stations

  def initialize(starting_station, end_station)
    @stations = [starting_station, end_station]
  end

  def display
    stations.each { |st| puts st.name }
    puts '===================='
  end

  def delete_station(station_name)
    stations.delete_if { |st| st.name if st.name == station_name }
  end

  def add_station(new_station)
    stations.insert(-2, new_station)
  end
end
