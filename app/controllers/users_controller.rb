class UsersController < ApplicationController

    get "/login" do 
        erb :login
    end

    #Creates a user
    post "/login" do 
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id #logs the user in 
            redirect "users/#{@user.id}"
        else
            redirect "/login"
        end
    end

    get "/signup" do 
        erb :signup
    end 

    post "/signup" do  
        if params[:username] != "" && params[:passowrd] != "" && params[:email] != ""
            @user = User.create(name: params[:username], email: params[:email], password: params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect "/signup"
        end
    end

    #user show route
    get "/users/:id" do
        if logged_in?
            @user = User.find_by(id: params[:id])
            erb :"/users/show"
        else
            redirect "/"
        end
    end

    get "/logout" do 
        if logged_in?
            session.clear
            redirect "/"
        else
            redirect "/"
        end
    end


end