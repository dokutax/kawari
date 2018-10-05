require 'logger'

module Kawari
  module Helpers
    class Logs
      @@logger = nil

      attr_accessor :klass

      def initialize(klass)
        @klass = klass
        get_logger
      end

      def info(msg)
        @@logger.info(format(msg))
      end

      def debug(msg)
        @@logger.debug(format(msg))
      end

      def error(msg)
        @@logger.error(format(msg))
      end

      private

      def get_logger
        @@logger ||= Logger.new(STDOUT)
      end

      def format(msg)
        klass.to_s + ' - ' + msg.to_s
      end
    end
  end
end