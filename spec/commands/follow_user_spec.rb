require "commands/follow_user"

RSpec.describe FollowUser, '#match' do
  context 'with matching line' do
    it 'parses the line and creates a follower' do
      user = User.get("FollowUser")
      
      user.follow("TargetUser")
      
      expect(user.follows.size).to eq 1
      user.follows.each { |u| expect(u).to eq User.get("TargetUser") }
    end
  end
end
