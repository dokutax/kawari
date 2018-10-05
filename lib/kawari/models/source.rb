module Kawari
  module Models
    class Source < Sequel::Model
      one_to_one :classifier, :key => :classifier_id, :primary_key => :classifier_id
      one_to_one :parser, :key => :parser_id, :primary_key => :parser_id
    end
  end
end
