# follow_user.rb

class FollowUser
  def match(line)
    line.match(/^(?<user>[A-Za-z]+)\s*follow\s*(?<target>.*)$/) do |m|
      user   = m[:user]
      target = m[:target]

      User.get(user).follow(target)
    end
  end
end
