require 'sinatra'

def service_ready?
  if ENV['TOKEN']
    true
  else
    false
  end
end

before(/^(?!\/status)/) do
  unless service_ready?
    redirect "/status"
  end
end

get '/' do
  "<h1 align='center'>This is an example app.</h1><br /><p>ENV['TOKEN']: #{ENV['TOKEN']}</p>"
end

# TODO this should perform some sort of check to ensure the app is ready
# to recieve traffic.
get '/status' do
  if service_ready?
    'OK'
  else
    status 500
    body 'Service Not Ready: API Token is not initialized. Provide a token using the TOKEN environment variable.'
  end
end
