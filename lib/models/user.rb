# user.rb

class User
  attr_reader :name, :posts, :follows

  def initialize(name)
    @name  = name
    @posts = Array.new
    @follows = Array.new
  end

  def post(content)
    @posts << Post.new(self, content)
  end

  def follow(user)
    @follows << User.get(user)
  end

  def wall
    @follows.flat_map { |f| f.posts }
      .concat(@posts)
      .sort { |a, b| a.created <=> b.created }
  end

  @@users = {}

  def User.get(name)
    if not @@users.key? name
      @@users[name] = User.new name
    end

    @@users[name]
  end

end
