class GamesController < ApplicationController

    def show
        @game = Game.find(params[:id])
        @clue = Clue.new
    end
    
    def new
        @game = Game.new
    end

    def create
        @game = Game.new
        @game.words = Word.generate_word_list
        @game.player_one = current_user
        @game.player_one.color = "red"
        @game.player_two = User.all.reject{ |user| user == current_user}.first
        @game.player_two.color = "blue"
        @game.save
        redirect_to game_path(@game)
    end

    def update(game_id, params)
        @game = Game.find(id = game_id)
        @game.update(params)
    end
    
    private

    def game_params
        params.require(:game).permit(:words)
    end

end
