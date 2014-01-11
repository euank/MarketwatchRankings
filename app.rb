require 'marketwatch/client'
require 'sinatra'
require 'json'
require './config.rb'

mw = Marketwatch::Client.new
unless mw.login(MarketwatchRankings::Config::USERNAME, MarketwatchRankings::Config::PASSWORD)
  raise "Could not login"
end

get '/rankings/:gamename' do
  mw.get_rankings(params[:gamename]).to_json
end