require 'uri'
require 'cgi'

module Kawari
  class Item
    attr_accessor :title, :link, :classifier, :id
    def initialize(title, link)
      @title = title.gsub('.', ' ')
      @link = link
    end

    def id
      id ||= get_id
    end

    def to_torrent(source)
      {}.tap do |item|
        item[:source_id] = source[:source_id]
        item[:title] = title
        item[:t_id] = id
        item[:downloaded] = false
      end
    end

    def to_hash
      {}.tap do |item|
        item[:title] = title
        item[:link] = link
      end
    end

    private

    def get_id
      uri = URI.parse(link)
      query = CGI.parse(uri.query)
      @id = query['id'].first.to_i
    end
  end
end