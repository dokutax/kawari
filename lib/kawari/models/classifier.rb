module Kawari
  module Models
    class Classifier < Sequel::Model
      one_to_many :source, :key => :classifier_id, :primary_key => :classifier_id
    end
  end
end