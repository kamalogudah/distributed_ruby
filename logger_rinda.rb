require 'logger'
require 'rinda/ring'

DRb.start_service
ring_server = Rinda::RingFinger.primary

tuple1 = [:logging_service, :Logger, ::Logger.new(STDOUT), 'Primary Logger']
tuple2 = [:logging_service, :Logger, ::Logger.new(STDOUT), 'Secondary Logger']
tuple3 = [:logging_service, :Logger, ::Logger.new(STDOUT), 'Primary Logger']

ring_server.write(tuple1, Rinda::SimpleRenewer.new)

ring_server.write(tuple1, Rinda::SimpleRenewer.new)

ring_server.write(tuple1, Rinda::SimpleRenewer.new)

logger = ring_server.read([nil, :Logger, nil, nil])

puts logger.inspect
logger = ring_server.read([nil, nil, nil, nil])

puts logger.inspect

logger = ring_server.read([nil, nil, nil, 'Primary Logger'])

puts logger.inspect
# DRb.thread.join