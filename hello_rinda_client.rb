require 'rinda/ring'
DRb.start_service
ring_server = Rinda::RingFinger.primary
# service = ring_server.read([:hello_world_service, nil, nil, nil])
service = ring_server.read({'service_name' => :hello_world_service, 'service_class' => nil, 'service_instance' => nil, 'service_description' => nil})
# server = service[2]
server = service['service_instance']

puts server.say_hello
puts service.inspect