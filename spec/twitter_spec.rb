require_relative 'spec_helper'

describe Aggregate::Twitter do
  describe Aggregate::Twitter::Activity do
    it "should fetch results from the twitter api" do
      with_twitter_stubbed("pzimbelman", [1,2,3]) do
        Aggregate::Twitter::Activity.new("pzimbelman").activity.should == [1,2,3]
      end
    end
  end

  describe Aggregate::Twitter::Normalizer do
    it "should return values under the correct interface" do
      status = twitter_status_from({"text" => "my status"})
      formatted = Aggregate::Twitter::Normalizer.new([status]).to_aggregate
      formatted.first.text.should == "my status" 
    end

  end
end
