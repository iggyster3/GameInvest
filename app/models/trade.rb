
class Trade

  include DataMapper::Resource

  belongs_to :asset
  belongs_to :user

  property :id, Serial
  property :price, Float
  property :quantity, Integer
  property :trade_time, DateTime
  property :side, Text


end
