class Station
attr_reader :name

  def initialize(name)
    @name = name
    @arr = []
  end

  def add_train(tr)
    @arr << tr
  end

  def show_trains
    puts @arr.map {|i| "#{i.train_number}; #{i.type}; #{i.num_of_wagons}"}
  end

  def freight_trains
    @arr.map {|i| "#{i.train_number}; #{i.type}; #{i.num_of_wagons}"}.each {|i| puts i if i.include?("freight")}
  end

  def pass_trains
    @arr.map {|i| "#{i.train_number}; #{i.type}; #{i.num_of_wagons}"}.each {|i| puts i if i.include?("pass")}
  end

  def del_train(index)
    @arr.delete_at(index)
  end
end

class Route
  attr_reader :starting_station, :end_station

  def initialize(starting_station, end_station)
    @starting_station = starting_station
    @end_station = end_station
    @arr = [starting_station, end_station]
  end

  def show_st
    puts @arr.map {|st| st.name}
  end

  def add_st(new_station)
    @arr.delete_at(-1)
    @arr << new_station
    @arr << @end_station
  end

  def del_st(index)
    @arr.delete_at(index)
  end

end

class Train
  attr_reader :train_number, :type, :num_of_wagons, :speed

  def initialize(train_number, type, num_of_wagons)
    @train_number = train_number
    @type = type
    @num_of_wagons = num_of_wagons
    @speed = 0
    @arr = []
  end

  def speed_up
    @speed += 50
  end

  def stop
    @speed = 0
  end

  def add_wagon
    @num_of_wagons += 1 if @speed == 0
  end

  def delete_wagon
    @num_of_wagons -= 1 if @speed == 0
  end

end
