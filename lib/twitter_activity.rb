require 'twitter'
require_relative 'activity'

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

    class Normalizer

      def initialize(activity)
        @activity = activity
      end

      def to_aggregate
        @activity.map { |a| Aggregate::Activity.new(a.text) }
      end
    end
  end
end
