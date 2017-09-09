require "models/post"

RSpec.describe Post, "#new" do
  it "initializes a new post with content" do
    post = Post.new "Hello World!"
    expect(post.content).to eq "Hello World!"
  end

  it "initializes a new post with the current time" do
    test_time = Time.now
    allow(Time).to receive(:now).and_return(test_time)
    post = Post.new "Wow!"
    expect(post.created).to eq test_time
  end
end
