class GamesController < ApplicationController

    def show
        @game = Game.find(params[:id])
    end
    
    def new
        @game = Game.new
    end

    def create
        @game = Game.new
        @game.words = Word.generate_word_list
        @game.player_one = current_user
        @game.save
        redirect_to root_path
    end


end
