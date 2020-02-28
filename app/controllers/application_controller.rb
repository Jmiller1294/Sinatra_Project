require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "games"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      erb  :"/user/#{current_user.id}"
    else
      erb :welcome
    end
  end

  #helper methods
  def redirect_if_not_logged_in
    if !logged_in?
      redirect '/'
    end
  end


  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
