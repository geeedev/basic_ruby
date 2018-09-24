class PassengerTrain < Train
  attr_reader :type

  def initialize(train_number)
    super
    @type = 'passenger'
  end

  def add_wagon(wagon)
    if wagon.type == 'passenger'
      super
    else
      puts 'error'
    end
  end
end
