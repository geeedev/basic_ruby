require_relative 'station'
require_relative 'train'
require_relative 'route'

st1 = Station.new('Moscow')
st2 = Station.new('St. Petersburg')
ro = Route.new(st1, st2)
tr1 = Train.new('1', 'passenger', 12)
tr2 = Train.new('2', 'freight', 16)
tr1.add_route(ro)
st1.display
