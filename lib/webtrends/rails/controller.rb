module Webtrends
  module Rails
    module Controller
      def self.included(base)
        base.send(:extend, ClassMethods)
      end

      def analytics_visitor_id
        /id=([\w\-]*)/.match(cookies['WT_FPC'].to_s).tap do |match|
          return match.captures.first if match
        end
      end

      def analytics_tags
        { dcsuri: request.path, dcsdat: (Time.now.to_f * 1000).to_i, dcssip: request.domain,
          'WT.es' => "#{request.domain}#{request.path}", 'WT.co_f' => analytics_visitor_id.to_s }
      end

      module ClassMethods
        def track(object_to_track, options, &blk)
          before_action(options) do |controller|
            tags = controller.analytics_tags
            yield(tags) if block_given?
            controller.public_send(object_to_track).webtrends_tags = tags
          end
        end
      end
    end
  end
end