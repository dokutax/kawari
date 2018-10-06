# encoding: utf-8
require 'sequel'

module Kawari
  module Models
    DB = Sequel.postgres ENV['SCRAPER_DB'], user: ENV['SCRAPER_USER'], password: ENV['SCRAPER_PASS'], host: ENV['SCRAPER_HOST'], port: ENV['SCRAPER_PORT']
    DB << "SET CLIENT_ENCODING TO 'UTF8';"
  end
end

require_relative 'models/classifier'
require_relative 'models/log'
require_relative 'models/movie'
require_relative 'models/parser'
require_relative 'models/show'
require_relative 'models/source'
require_relative 'models/torrent'