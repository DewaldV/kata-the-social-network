# read_wall.rb

class ReadWall
  def match(line)
    line.match(/^(?<user>[A-Za-z]+)\s+wall$/) do |m|
      user = m[:user]
      
      User.get(user).wall
    end
  end
end
