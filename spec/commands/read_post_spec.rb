require "commands/read_posts"

RSpec.describe ReadPosts, "#match" do
  context "with matching line" do
    it "parses the line and returns the posts" do
      post_time = Time.new 2017, 9, 10, 9, 0, 0, "+00:00"
      allow(Time).to receive(:now).and_return(post_time)
      User.get("ReadPostsUser").post("What a wonderful day!")
      command = ReadPosts.new
      now_time = Time.new 2017, 9, 10, 9, 5, 0, "+00:00"
      allow(Time).to receive(:now).and_return(now_time)

      posts = command.match("ReadPostsUser")

      expect(posts.size).to eq 1
      posts.each { |post|  expect(post).to include "ReadPostsUser -> What a wonderful day! (5 minutes ago)" }
    end
  end
end
