require 'sinatra'

get '/' do
  '<h1 align="center">This is an example app.</h1>'
end

# TODO this should perform some sort of check to ensure the app is ready
# to recieve traffic.
get '/status' do
  'OK'
end
