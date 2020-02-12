class UsersController < ApplicationController

    get "/login" do 
        erb :login
    end

    #Creates a user
    post "/login" do 
        @user = User.find_by(username: params[:username])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id #logs the user in 
            redirect "users/#{@user.id}"
        else

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
            @user = User.find_by(id: params[:id])
            erb :"/users/show"
        
    end

    get "/logout" do 
        session.clear
        redirect "/"
    end


end