module Kawari
  module Models
    class Torrent < Sequel::Model
      one_to_many :source, :key => :source_id, :primary_key => :source_id
      plugin :timestamps, :create => :ctime, :update => :mtime, :force => true, :update_on_create => true
    end
  end
end
