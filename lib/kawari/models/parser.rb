module Kawari
  module Models
    class Parser < Sequel::Model
      one_to_many :source, :key => :parser_id, :primary_key => :parser_id
    end
  end
end
