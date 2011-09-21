require 'rubygems'

require 'bundler/setup'
require 'sinatra'

set :port, 80

get '/' do
	erb :index
end

