require 'rest-client'

module Kawari
  class Download
    class << self
      def get(url)
        begin
          RestClient.get(url)
        rescue
          raise
        end
      end
    end
  end
end

