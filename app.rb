require 'sinatra/base'

class DevDaybook < Sinatra::Base
  get '/' do
  end

  run! if app_file == $0
end
