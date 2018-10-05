module Kawari
  module Models
    class Log < Sequel::Model
      plugin :timestamps, :create => :ctime, :update => :mtime, :force => true, :update_on_create => true
    end
  end
end
