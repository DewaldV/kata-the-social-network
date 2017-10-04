require "models/post"


RSpec.describe Post, "#new" do
  it "initializes a new post with content" do
    post = Post.new(User.get("test"), "Hello World!")
    expect(post.content).to eq "Hello World!"
  end

  it "initializes a new post with the current time" do
    test_time = Time.now
    allow(Time).to receive(:now).and_return(test_time)
    post = Post.new(User.get("test"), "Wow!")
    expect(post.created).to eq test_time
  end
end

RSpec.describe Post, "#to_s" do
  it "prints the post to a string" do
    post_time = Time.new 2017, 9, 10, 9, 0, 0, "+00:00"
    allow(Time).to receive(:now).and_return(post_time)
    post = Post.new(User.get("test"), "Hello World!")

    now_time = Time.new 2017, 9, 10, 9, 5, 0, "+00:00"
    allow(Time).to receive(:now).and_return(now_time)

    expect(post.to_s).to eq "test -> Hello World! (5 minutes ago)"
  end
end
