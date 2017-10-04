# post.rb
require 'time_ago_in_words'

class Post
  attr_reader :content, :created

  def initialize(user, content)
    @user    = user
    @content = content
    @created = Time.now
  end

  def to_s
    "#{@user.name} -> #{@content} (#{@created.ago_in_words})"
  end

end
