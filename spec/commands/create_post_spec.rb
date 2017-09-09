require "commands/create_post"

RSpec.describe CreatePost, "#match" do
  context "with matching line" do
    it "parses the line and creates the post" do
      command = CreatePost.new
      line = "James -> Hello World!"

      command.match(line)

      user = User.get("James")
      expect(user.posts.size).to eq 1
      user.posts.each { |post|  expect(post.content).to eq "Hello World!" }
    end
  end
end
