require 'rest-client'

module Kawari
  module Helpers
    class Downloader
      def self.get(url)
        begin
          RestClient.get(url)
        rescue
          raise
        end
      end
    end
  end
end
