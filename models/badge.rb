class Badge
  include DataMapper::Resource

  property :id,       Serial
  property :user,     String
  property :image,    Binary, length: 300000

  timestamps :at
end

DataMapper.finalize
