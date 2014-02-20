module Webtrends
  module Rails
    module Controller
      def self.included(base)
        base.send(:extend, ClassMethods)
      end

    private

      def analytics_visitor_id
        visitor_id = ''
        /id=([\w\-]*)/.match(cookies['WT_FPC']).tap do |match|
          visitor_id = match.captures.first if match
        end
        visitor_id
      end

      def analytics_tags
        { dcsuri: request.path, dcsdat: (Time.now.to_f * 1000).to_i, dcssip: request.domain,
          'WT.es' => "#{request.domain}#{request.path}", 'WT.co_f' => analytics_visitor_id }
      end

      module ClassMethods
        def track(object_to_track, options)
          before_action(options) do |controller|
            tags = analytics_tags
            yield(tags) if block_given?
            controller.public_send(object_to_track).webtrends_tags = tags
          end
        end
      end
    end
  end
end