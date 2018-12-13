require 'drb'
require 'drb/acl'

# make sure no one can call eval() and related methods remotely!
$SAFE = 1

class HelloWorldServer
  def say_hello
    'Hello, World!'
  end
end

acl = ACL.new(%w{ deny all allow 192.168.0.13 })
DRb.install_acl(acl)

DRb.start_service("druby://127.0.0.1:61676", HelloWorldServer.new)
DRb.thread.join