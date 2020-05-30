require 'sinatra/base'
require "./lib/dailylog"

class DevDaybook < Sinatra::Base
  get '/dailylogs' do
    @logs = DailyLog.all

    erb :'dailylogs/index'
  end

  get '/dailylogs/create' do
    erb :'dailylogs/create'
  end

  run! if app_file == $0
end
