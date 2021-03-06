require "rails_helper"

RSpec.describe YoutubeApi do
  context "video is available", :vcr do
    it "returns video data" do
      video_id = "LO1mTELoj6o"
      data = described_class.get_video_data(video_id)

      expect(data[:title]).to eq "7 Ways to Maximize Misery 😞"
    end
  end

  context "video is unavailable", :vcr do
    it "returns video data" do
      video_id = "invalidID"
      data = described_class.get_video_data(video_id)

      expect(data).to be_empty
    end
  end
end
