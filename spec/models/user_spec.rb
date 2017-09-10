require "models/user"

RSpec.describe User, "#new" do
  it "sets a new user's name" do
    user = User.new "James"
    expect(user.name).to eq "James"
  end

  it "creates an empty list of posts" do
    user = User.new "James"
    expect(user.posts).to eq []
  end
end


RSpec.describe User, "#get" do
  it "creates a user if it doesn't exist" do
    user = User.get("James")
    expect(user.name).to eq "James"
  end

  it "returns the same instance of user when called" do
    expect(User.get("Sally").posts).to eq []
    User.get("Sally").posts << "A post!"
    expect(User.get("Sally").posts).to eq [ "A post!" ]
  end
end

RSpec.describe User, "#post" do
  it "creates a new post" do
    user = User.new "Jerry"
    user.post("Hi!")

    expect(user.posts.size).to eq 1
    user.posts.each { |post| expect(post.content).to eq "Hi!" }
  end
end

RSpec.describe User, '#wall' do
  it "returns the wall for the user" do
    user = User.new "UserWall"
    user.post("On the wall it goes!")

    expect(user.wall.size).to eq 1
    user.wall.each do |item|
      puts item
      expect(item['user'].name).to eq "UserWall"
      expect(item['post'].content).to eq "On the wall it goes!"
    end
  end
end
