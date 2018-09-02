class PassengerTrain < Train
  def add_wagon(wagon)
    super if wagon.class == PassengerWagon
  end
end
