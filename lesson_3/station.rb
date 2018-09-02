class Station
  def initialize(name)
    @name = name
    @trains = []
  end

  def display(type = nil)
    selected_trains =
      if ['passenger', 'freight'].include?(type)
        @trains.select { |t| t.type == type }
      else
        @trains
      end
    selected_trains.each {|tr| puts "#{tr.train_number}, #{tr.type}, #{tr.wagons_quantity}"}
  end

  def add_train(train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train)
  end
end
