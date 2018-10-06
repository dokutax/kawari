require 'rest-client'

module Kawari
  class Download
    def self.get(url)
      begin
        RestClient.get(url)
      rescue
        raise
      end
    end
  end
end

