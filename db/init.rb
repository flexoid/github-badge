require 'dm-core'
require 'dm-timestamps'
require 'dm-migrations'

require Dir.pwd + '/models/badge'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/#{Sinatra::Application.environment}.sqlite")
