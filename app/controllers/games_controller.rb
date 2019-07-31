
class GamesController < ApplicationController
   def index
      games = Game.all
      render json: games
   end

   def show
      game = Game.find(params[:id])
      render json: game
   end

   def create
      game = Game.create(game_params)
      if game.valid?
         render json: game
      else 
         render json: {message: "not complete"}
      end
   end

   def update
      game = Game.find(params[:id])
      # byebug
      game.update(game_params)
      render json: game
   end

   def destroy
      game = Game.find(params[:id])
      game.destroy
      render json: game
   end

   private

   def game_params
      params.require(:game).permit(:score, :user_id, :id)
   end

   def default
      {
         :except => [:created_at, :updated_at]
      }        
   end
end
