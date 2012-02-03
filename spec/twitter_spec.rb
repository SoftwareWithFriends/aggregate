require_relative 'spec_helper'

describe Aggregate::Twitter::Activity do
  it "should fetch results from the twitter api" do
    with_twitter_stubbed("pzimbelman", [1,2,3]) do
      Aggregate::Twitter::Activity.new("pzimbelman").activity.should == [1,2,3]
    end
  end
end
