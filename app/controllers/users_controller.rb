class UsersController < ApplicationController

    get "/login" do 
        erb :login
    end

    post "/login" do 
        @user = User.find_by(:username params[:username])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "users/#{@user.id}"
        else

    end

    get "/signup" do 
        erb :signup
    end 

    post "/signup" do  

    end

    get "/users/:id" do

    end


end