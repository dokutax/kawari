require 'bunny'

module Kawari
  module Adapter
    class RabbitMQ
      class << self

        @@conn = nil
        @@channel = nil
        @@exchange = nil
        @@queue = nil

        def conn
          if @@conn.nil?
            @@conn = Bunny.new(user: ENV['BUNNY_USER'], password: ENV['BUNNY_PASS'], host: ENV['BUNNY_HOST'])
            @@conn.start
          end

          @@conn
        end

        def channel
          conn if @@conn.nil?
          @@channel ||= @@conn.create_channel
        end

        def exchange
          channel if @@channel.nil?
          @@exchange ||= @@channel.default_exchange
        end

        def queue
          channel if @@channel.nil?
          @@queue ||= @@channel.queue("auto_torrent.downloads", :auto_delete => false)
        end

        def publish(payload)
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

        def clear_conn
          @@conn = nil
          @@channel = nil
          @@exchange = nil
          @@queue = nil
        end

      end
    end
  end
end