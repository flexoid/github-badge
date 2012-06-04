require 'dm-core'
require 'dm-timestamps'
require 'dm-migrations'

DataMapper::Logger.new($stdout, :debug) if [:development, :test].include? Sinatra::Application.environment
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/#{Sinatra::Application.environment}.sqlite")
