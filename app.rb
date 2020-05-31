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

  post '/dailylogs' do
    title = params['title']
    log = params['log']
    connection = PG.connect(dbname: 'dev_daybook_test')
    connection.exec("INSERT INTO dailylogs (title, log) VALUES('{#title}, {#log}')")
    p "Form data submitted from /dailogs route"
  end

  run! if app_file == $0
end
