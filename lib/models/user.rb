# user.rb

class User
  @@users = {}

  attr_reader :name, :posts

  def initialize(name)
    @name  = name
    @posts = Array.new
  end

  def post(content)
    @posts << Post.new(content)
  end

  def wall
    @posts.map do |post|
      { 'user': self, 'post': post }
    end
  end

  def User.get(name)
    if not @@users.key? name
      @@users[name] = User.new name
    end

    @@users[name]
  end

end
