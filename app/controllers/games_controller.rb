class GamesController < ApplicationController
   def index
      games = Game.all
      render json: games
   end

   def show
      game = Game.find_by(id: params[:id])
      render json: game
   end

   def create
      game = Game.create(game_params)
      if game.valid?
         render json: character
      else 
         render json: {message: "not complete"}
      end
   end

   def update
      game = Game.find_by(id: params[:id])
      game.update
      render json: game
   end

   def destroy
      game = Game.find_by(id: params[:id])
      game.destroy
      render json: game
   end

   private

   def character_params
      params.require(:game).permit(:score, :user_id)
   end

   def default
      {
         :except => [:created_at, :updated_at]
      }        
   end
end
