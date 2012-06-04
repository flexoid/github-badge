class Badge
  include DataMapper::Resource

  property :id,       Serial
  property :user,     String
  property :image,    Text

  timestamps :at
end

DataMapper.finalize
