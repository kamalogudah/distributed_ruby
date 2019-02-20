require 'rinda/ring'
DRb.start_service
ring_server = Rinda::RingFinger.primary

threads = []
10.times do |th|
  threads << Thread.new do
    10.times do |i|
        service = ring_server.take([:count_service, nil])
        sleep(rand(5))
        puts "#{th}: #{i} (#{service.inspect})\n"
        updated_count = service[1] + 1
        puts "#{th}: #{i} (#{updated_count})\n"
        ring_server.write([:count_service, updated_count])
    end
end
end
threads.each {|t| t.join }
service = ring_server.read([:count_service, nil])
puts service.inpsect

