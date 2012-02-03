require 'rspec'
require_relative '../lib/twitter_activity'


def with_twitter_stubbed(username, activity)
  Twitter.should_receive(:user_timeline).with(username).and_return(activity)
  yield
end
