class User
  include DRbUndumped

  attr_accessor :id
  attr_accessor :username

  def save
    "Saved: <#{ self.id } : username: #{ self.username } >"
  end
end