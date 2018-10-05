require 'bunny'

module Kawari
  module Adapter

    class RabbitMQ
      @@conn = nil
      @@channel = nil
      @@exchange = nil
      @@queue = nil

      def self.conn
        if @@conn.nil?
          @@conn = Bunny.new(user: ENV['BUNNY_USER'], password: ENV['BUNNY_PASS'], host: ENV['BUNNY_HOST'])
          @@conn.start
        end

        @@conn
      end

      def self.channel
        conn if @@conn.nil?
        @@channel ||= @@conn.create_channel
      end

      def self.exchange
        channel if @@channel.nil?
        @@exchange ||= @@channel.default_exchange
      end

      def self.queue
        channel if @@channel.nil?
        @@queue ||= @@channel.queue("auto_torrent.downloads", :auto_delete => false)
      end

      def self.publish(payload)
        unless channel.open?
          clear_conn
        end

        conn
        channel
        exchange
        queue
        exchange.publish(payload, routing_key: queue.name)
      rescue
        clear_conn
      end

      def self.clear_conn
        @@conn = nil
        @@channel = nil
        @@exchange = nil
        @@queue = nil
      end

    end

  end
end