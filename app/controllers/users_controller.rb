class UsersController < ApplicationController

    get '/signup' do
        redirect '/snippets' if logged_in?
        erb :'users/new'
    end

    post '/signup' do 
        @user = User.new(params)

        if @user.save  
            session["user_id"] =  @user.id
            redirect "/snippets"
        else
            session[:temp_errors] = @user.errors.full_messages
            redirect '/signup'
        end
    end

    # -------------------

    get '/login' do 
        redirect '/snippets' if logged_in?
        erb :'sessions/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session["user_id"] = user.id
            redirect '/snippets'
        elsif user
            session[:temp_errors] = ["Invalid email or password"]
        end
        redirect '/login'
    end

    # -------------------


    get '/logout' do 
        logout!
        redirect '/login'
    end

    # -------------------
    # -------------------
    # -------------------
    # -----SHOW PAGE-----


    get '/users/:slug' do
        redirect '/login' if !logged_in?
        @current_user = current_user 
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end

    get '/follow/:slug' do 
        redirect '/login' if !logged_in?
        followed = User.find_by_slug(params[:slug])
        current_user.followed_users << followed
        session[:temp_errors] = ["You have successfully followed #{followed.username}"]
        redirect "/users/#{followed.slug}"
    end

    get '/unfollow/:slug' do 
        redirect '/login' if !logged_in?
        followed = User.find_by_slug(params[:slug])
        current_user.followed_users.delete(followed)
        session[:temp_errors] = ["You have successfully unfollowed #{followed.username}"]
        redirect "/users/#{followed.slug}"
    end


end