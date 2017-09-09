# create_post.rb

class CreatePost
  attr_reader :matched_line
  @@pattern = /^(?<user>[A-Za-z]+)\s*->\s*(?<message>.*)$/

  def match(line)
    line.match(@@pattern) do |m|
      user    = m['user']
      message = m['message']

      User.get(user).post(message)
    end
  end
end
