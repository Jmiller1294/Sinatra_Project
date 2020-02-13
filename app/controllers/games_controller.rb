class GamesController < ApplicationController
    
    #Displays all games
    get "/games" do 
        @games = Game.all
        erb :"/games/index"
    end

    #Dislpays a form to create a new game
    get "/games/new" do 
        erb :"/games/new"
    end

    #Creates a new game
    post "/games" do 
        if logged_in?
            if params[:name] != "" && params[:console] !="" && params[:release_date] != "" && params[:details] !=""
                @game = Game.create(user_id: current_user.id, name: params[:name], console: params[:console], release_date: params[:release_date], details: params[:details])
                redirect "/games/#{@game.id}"
            else
                redirect "/games/new"
            end
        else
            redirect "/"
        end
    end

    #Displays a game based on id
    get "/games/:id" do 
        @game = Game.find_by(id: params[:id])
        erb :"/games/show"
    end

    #Displays a form to edit a game
    get "/games/:id/edit" do 
        @game = Game.find_by(id: params[:id])
        if logged_in?
            if @game.user == current_user
                erb :"/games/edit"
            else
                redirect "/"
            end
        else
            redirect "/"
        end
    end

    #Modifies an existing game
    patch "/games/:id" do 
        @game = Game.find_by(id: params[:id])
        if logged_in?
            if @game.user == current_user
                game.name = params[:name]
                @game.console = params[:console]
                @game.release_date = params[:release_date]
                @game.details = params[:details]
                @game.save
                redirect "/games/#{@game.id}"
            else
                redirect "/"
            end
        else
            redirect "/"
        end
    end

    #deletes an existing game 
    delete "/games/:id" do 
        @game = Game.find_by(id: params[:id])
        if logged_in?
            if @game.user == current_user
                @game.delete
                redirect "/games"
            else
                redirect "/"
        else
            redirect "/"
        end
    end
    
    
    

end