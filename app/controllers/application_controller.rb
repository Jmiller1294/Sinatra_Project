require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "games"
  end

  get "/" do
    if logged_in?
      redirect "/user/#{current_user.id}"
    else
      erb :welcome
    end
  end

  #helper methods

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
