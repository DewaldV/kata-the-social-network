require "commands/read_wall"

RSpec.describe ReadWall, "#match" do
  context "with matching line" do
    it "parses the line and returns the posts" do
      post_time = Time.new 2017, 9, 10, 9, 0, 0, "+00:00"
      allow(Time).to receive(:now).and_return(post_time)
      User.get("TargetUser").post("What a wonderful day!")
      User.get("ReadWallUser").follow("TargetUser")
      command = ReadWall.new
      now_time = Time.new 2017, 9, 10, 9, 5, 0, "+00:00"
      allow(Time).to receive(:now).and_return(now_time)

      wall = command.match("ReadWallUser wall")

      expect(wall.size).to eq 1
      wall.each { |w|  expect(w).to include "TargetUser -> What a wonderful day! (5 minutes ago)" }
    end
  end
end
