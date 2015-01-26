require 'sinatra'
require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require 'mailgun'
require 'yahoo_finance'
require_relative 'helpers/application'

require 'byebug'

set :partial_template_engine, :erb
set :public, 'public'
use Rack::Flash
use Rack::MethodOverride



get '/' do

  @asset = "EURUSD=X"
  price = get_quote(@asset)
  @bid,@ask = price.bid,price.ask
  @last_trade_price = price.last_trade_price
  erb :index
end

post '/' do

  flash[:notice] = "You just bought."
  puts params
  erb :index
end
