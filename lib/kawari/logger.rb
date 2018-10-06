require 'logger'

module Kawari
  class Logger < ::Logger
    def initialize(klass)
      super(STDOUT, progname: klass)
    end
  end
end