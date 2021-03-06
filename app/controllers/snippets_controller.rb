class SnippetsController < ApplicationController
    get '/snippets' do
        redirect '/login' if !logged_in?
        @user = current_user
        @snippets = Snippet.all
        erb :'/snippets/index'
    end

    get '/snippets/new' do
        @user = current_user
        if logged_in?
            erb :'snippets/new' 
        else
            redirect '/login'
        end
    end

    post '/snippets' do 
        snippet = current_user.snippets.build(params)
        
        if snippet.save
            session[:temp_errors] = ["Your snippet has been saved."]            
            redirect "/snippets/#{snippet.id}"
        else
            session[:temp_errors] = snippet.errors.full_messages
            redirect '/snippets/new'
        end
    end

    get '/snippets/personal-feed' do 
        redirect '/login' if !logged_in?
        @user = current_user
        @snippets = []
        Snippet.all.each do |s|
            if @user.followed_users.include? s.user 
                @snippets << s
            end
        end
        erb :'/snippets/followed-index'
    end

    post '/snippets/search' do 
        redirect '/login' if !logged_in?
        @user = current_user
        @user_results = User.where("username LIKE ?", "%#{params[:query]}%")

        @snippets = []

        Snippet.all.each do |s|
            @snippets << s if @user_results.include?(s.user)
        end

        
        erb :'/snippets/index'
    end

    get '/snippets/:id' do 
        if logged_in?
            @current_user = current_user
            @snippet = Snippet.find_by_id(params[:id])
            erb :'/snippets/show'
        else
            redirect '/login'
        end
    end


    get '/snippets/:id/edit' do 
        if logged_in? 
            user = Snippet.find_by_id(params[:id]).user
            if user.id == current_user.id
                @snippet = Snippet.find_by_id(params[:id])
                erb :'/snippets/edit'
            else
                session[:temp_errors] = ["This snippet belongs to another user."]
                redirect '/snippets'
            end
        else
            session[:temp_errors] = ["You must be logged in to view that."]
            redirect "/login"
        end
    end

    patch '/snippets/:id' do 
        @snippet = Snippet.find_by_id(params[:id])
        params.delete("_method")
        if @snippet.update(params)
            session[:temp_errors] = ["Your snippet has been saved."]
            redirect "/snippets/#{@snippet.id}"
        else
            session[:temp_errors] = @snippet.errors.full_messages
            redirect "/snippets/#{@snippet.id}/edit"
        end
    end

    delete '/snippets/:id' do 
        user = Snippet.find_by_id(params[:id]).user
        if current_user == user         
            @snippet = Snippet.find_by_id(params[:id])
            @snippet.destroy
            session[:temp_errors] = ["Your snippet was deleted successfully."]
            slug = user.slug
            redirect "/users/#{slug}"
        else
            session[:temp_errors] = ["This snippet belongs to another user."]
            redirect '/snippets'
        end
    end

    get '/messagesuccess' do
        redirect '/login' if !logged_in? 
        @user = current_user
        erb :'/snippets/message-success'
    end

    
end