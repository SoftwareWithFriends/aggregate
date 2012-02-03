require 'rspec'
require_relative '../lib/twitter_activity'


def with_twitter_stubbed(username, activity)
  Twitter.should_receive(:user_timeline).with(username).and_return(activity)
  yield
end

def twitter_status_from(overrides = {})
  attrs = {"text" => "This is a tweet",
           "created_at" => Time.now,
           "profile_image_url" => "http://foo.com/pic.jpg" }.merge(overrides)
  Twitter::Status.new(attrs)
end
