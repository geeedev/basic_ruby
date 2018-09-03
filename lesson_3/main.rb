require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

st1 = Station.new('Station 1')
st2 = Station.new('Station 2')
ro = Route.new(st1, st2)
pass_tr = PassengerTrain.new(1)
car_tr = CargoTrain.new(2)
pass_tr.add_route(ro)
car_tr.add_route(ro)
st1.display
