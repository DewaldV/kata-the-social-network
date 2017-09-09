# create_post.rb

class ReadPosts
  attr_reader :matched_line
  @@pattern = /^(?<user>[A-Za-z]+)$/

  def match(line)
    line.match(@@pattern) do |m|
      username = m['user']

      user = User.get(username)
      user.posts.map do |post|
        "#{user.name} -> #{post.content} (#{post.created})"
      end
    end
  end
end
