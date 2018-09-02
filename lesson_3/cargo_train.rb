class CargoTrain < Train
  def add_wagon(wagon)
    super if wagon.class == CargoWagon
  end
end
