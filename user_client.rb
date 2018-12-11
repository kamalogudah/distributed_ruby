require 'drb'

user_server = DRbObject.new_with_uri("druby://127.0.0.1:61676")

user = user_server.find(1)

puts "user: #{ user.inspect } "

puts "original username: #{ user.username }"

user.username = 'kamalogudah'

puts user.save 

user = user_server.find(1)

puts "username now: #{ user.username }"