require 'rinda/ring'
require 'rinda/tuplespace'

class HelloWorldServer
    include DRbUndumped

    def say_hello
        'Hello, World!'
    end
end

DRb.start_service
Rinda::RingServer.new(Rinda::TupleSpace.new, 8080)
Rinda::RingServer.new(Rinda::TupleSpace.new)
ring_server = Rinda::RingFinger.primary
# ring_server.write([:hello_world_service, :HelloWorldServer, HelloWorldServer.new,
# 'I like to say hi!'], Rinda::SimpleRenewer.new )
ring_server.write({'service_name' => :hello_world_service, 'service_class' => :HelloWorldServer,'service_instance' => HelloWorldServer.new,
'service_description' => 'I like to say hi!'}, Rinda::SimpleRenewer.new )
DRb.thread.join
