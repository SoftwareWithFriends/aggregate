require 'twitter'

module Aggregate
  module Twitter
    class Activity
      def initialize(username)
        @username = username
      end

      def activity
        ::Twitter.user_timeline(@username)
      end
    end
  end
end
