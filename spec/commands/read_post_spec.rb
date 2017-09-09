require "commands/read_posts"

RSpec.describe ReadPosts, "#match" do
  context "with matching line" do
    it "parses the line and returns the posts" do
      command = ReadPosts.new
      User.get("ReadPosts").post("What a wonderful day!")
      line = "ReadPosts"

      posts = command.match(line)

      expect(posts.size).to eq 1
      posts.each { |post|  expect(post).to include "ReadPosts -> What a wonderful day!" }
    end
  end
end
