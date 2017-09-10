# post.rb
require 'time_ago_in_words'

class Post
  attr_reader :content, :created

  def initialize(content)
    @content = content
    @created = Time.now
  end

  def to_s
    "#{content} (#{created.ago_in_words})"
  end

end
