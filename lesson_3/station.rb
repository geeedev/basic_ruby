class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def display(type = nil)
    selected_trains =
      if ['passenger', 'cargo'].include?(type)
        trains.select { |tr| tr.type == type}
      else
        trains
      end
      puts selected_trains
  end

  def add_train(train)
    trains << train
  end

  def remove_train(train)
    trains.delete(train)
  end
end
