class CargoTrain < Train
  attr_reader :type

  def initialize(train_number)
    super
    @type = 'cargo'
  end

  def add_wagon(wagon)
    if wagon.type == 'cargo'
      super
    else
      puts 'error'
    end
  end
end
