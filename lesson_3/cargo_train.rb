class CargoTrain < Train
  attr_reader :type

  def initialize(train_number)
    super
    @type = 'cargo'
  end
  
  def add_wagon(wagon)
    super if wagon.type == 'cargo'
  end
end
