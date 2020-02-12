class GamesController < ApplicationController
    get "/games/new" do 
        erb :"/games/new"
    end

    post "/games" do 
        @game = Game.create(name: params[:name], console: params[:console], release_date: params[:release_date], details: params[:details])
        rediret "/games/#{@game.id}"
    end

    get "/games/:id" do 
        @game = Game.find_by(id: params[:id])
        erb :"/games/show"
    end

    get "/games/:id/edit" do
        erb :"/games/edit"
    end

    patch
    end

end