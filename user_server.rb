require 'drb'
require 'user'

class UserServer
  attr_accessor :users

  def initialize
    self.users = []
    5.times do |i|
      user = User.new
      user.id = i + 1
      user.username = "user#{i + 1}"
      self.users << user
    end
  end

  def find(id)
    self.users[id - 1]
  end
end

DRb.start_service("druby://127.0.0.1:67676", UserServer.new)
DRb.thread.join