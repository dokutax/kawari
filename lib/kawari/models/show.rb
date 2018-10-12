module Kawari
  module Models
    class Show < Sequel::Model
      def is_match?(ep)
        is_next?(ep) || false
      rescue
        false
      end

      def increment(classifier)
        self.season = classifier.season
        self.episode = classifier.episode
        self.save
      end

      private

      def is_next?(ep)
        same_title?(ep) && (next_episode?(ep) || next_season?(ep))
      rescue
        false
      end

      def same_title?(ep)
        title_matcher = Regexp.new('.*?' + ep.title.gsub(/[^0-9A-Za-z]/, '.*?') + '.*', Regexp::IGNORECASE)
        title_matcher =~ name
      rescue
        false
      end

      def next_episode?(ep)
        season == ep.season && (episode + 1) == ep.episode
      rescue
        false
      end

      def next_season?(ep)
        (season + 1) == ep.season && ep.episode == 1
      rescue
        false
      end
    end
  end
end