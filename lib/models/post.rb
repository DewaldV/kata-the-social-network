# post.rb

class Post
  attr_reader :content, :created

  def initialize(content)
    @content = content
    @created = Time.now
  end
end
