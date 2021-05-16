require "rails_helper"

RSpec.describe YoutubeApi do
  context "video is available" do
    it "returns video data" do
      return self.get_video_data(video_id)
    end
  end
end
