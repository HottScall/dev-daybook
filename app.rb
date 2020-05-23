require 'sinatra/base'

class DevDaybook < Sinatra::Base
  get '/' do
    "Daily Logs"
  end

  get '/dailylogs' do
    logs = ["daily log 1", "daily log 2", "daily log 3"]
    logs.join
  end

  run! if app_file == $0
end
