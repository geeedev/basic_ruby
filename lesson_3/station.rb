class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def display(type = nil)
    selected_trains =
      if ['PassengerTrain', 'CargoTrain'].include?(type)
        @trains.select { |t| t.сlass == type }
      else
        @trains
      end
    selected_trains.each {|tr| puts "#{tr.train_number}"}
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train)
  end
end
