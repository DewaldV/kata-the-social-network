# create_post.rb

class CreatePost
  def match(line)
    line.match(/^(?<user>[A-Za-z]+)\s*->\s*(?<message>.*)$/) do |m|
      user    = m['user']
      message = m['message']

      User.get(user).post(message)
    end
  end
end
