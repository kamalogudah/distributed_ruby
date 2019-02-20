require 'rinda/ring'
require 'rinda/tuplespace'

DRb.start_service
Rinda::RingServer.new(Rinda::TupleSpace.new, 8080)
Rinda::RingServer.new(Rinda::TupleSpace.new)
ring_server = Rinda::RingFinger.primary
ring_server.write([:count_service, 0], Rinda::SimpleRenewer.new)

DRb.thread.join