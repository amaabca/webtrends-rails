module Webtrends
  module Rails
    module Model
      attr_accessor :webtrends_tags

      def track_event
        Webtrends::Event.new(tags: webtrends_tags).track
      end
    end
  end
end