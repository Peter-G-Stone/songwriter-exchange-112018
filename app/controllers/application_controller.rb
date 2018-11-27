require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "supersecretnoonewillknow"
  end

  get '/' do 
    if logged_in?
      redirect '/snippets'
    end
    erb :homepage
  end

  helpers do 
    def logged_in?
      session[:user_id]
    end

    def current_user
      @user = User.find_by(id: session["user_id"])
    end
    
    def logout!      
      session.clear
    end
  end

end
