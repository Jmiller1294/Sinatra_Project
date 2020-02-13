class GamesController < ApplicationController
    
    get "/games" do 
        @games = Game.all
        erb :index

    end

    #Dislpays a form to create a new game
    get "/games/new" do 
        erb :"/games/new"
    end

    #Creates a new game
    post "/games" do 
        @game = Game.create(name: params[:name], console: params[:console], release_date: params[:release_date], details: params[:details])
        redirect "/games/#{@game.id}"
    end

    #Displays a game based on id
    get "/games/:id" do 
        @game = Game.find_by(id: params[:id])
        erb :"/games/show"
    end

    #Displays a form to edit a game
    get "/games/:id/edit" do 
        erb :"/games/edit"
    end

    #Modifies an existing game
    patch "/games/:id" do 
        @game = Game.find_by(id: params[:id])
        @game.name = params[:name]
        @game.console = params[:console]
        @game.release_date = params[:release_date]
        @game.details = params[:details]
        @game.save
        redirect "/games/#{@game.id}"
    end

    delete "/games/:id" do 
    end
    
    
    

end