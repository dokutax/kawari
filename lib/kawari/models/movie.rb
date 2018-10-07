module Kawari
  module Models
    class Movie < Sequel::Model
      def is_match?(item)
        complete_match?(item) || false
      rescue
        false
      end

      def increment(classifier)
        self.destroy
      end

      private

      def complete_match?(item)
        same_title?(item) && same_year?(item) && same_quality?(item)
      rescue
        false
      end

      def same_title?(item)
        title_matcher = Regexp.new('.*?' + item.title.gsub(/[^0-9A-Za-z]/, '.*?') + '.*', Regexp::IGNORECASE)
        title_matcher =~ name
      rescue
        false
      end

      def same_year?(item)
        item.year == year
      rescue
        false
      end

      def same_quality?(item)
        item.quality == quality
      rescue
        false
      end
    end
  end
end

