# create_post.rb

class ReadPosts
  def match(line)
    line.match(/^(?<user>[A-Za-z]+)$/) do |m|
      username = m['user']

      user = User.get(username)
      user.posts.map do |post|
        "#{user.name} -> #{post}"
      end
    end
  end
end
