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
        @game.player_two = User.all.reject{ |user| user == current_user}.first
        @game.save
        redirect_to game_path(@game)
    end
    private

end
