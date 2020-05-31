require 'sinatra/base'
require "./lib/dailylog"

class DevDaybook < Sinatra::Base

  attr_reader :id, :title, :log

  def initialize(id:, title:, log:)
    @id = id
    @title = title
    @log = log 
  end


  get '/dailylogs' do
    @logs = DailyLog.all

    erb :'dailylogs/index'
  end

  get '/dailylogs/create' do
    erb :'dailylogs/create'
  end

  post '/dailylogs' do
    DailyLog.create(title: params[:title], log: params[:log])
    redirect '/dailylogs'

  end

  run! if app_file == $0
end
