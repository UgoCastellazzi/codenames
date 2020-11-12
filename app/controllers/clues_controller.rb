class CluesController < ApplicationController

    def create
        @game = Game.find(params[:game_id])
        @clue = Clue.new(clue_params)
        @clue.game = @game
        @clue.user = current_user
        if @clue.save
            respond_to do |format|
                format.html
                format.json { render json: { success: true } }
            end
            # redirect_to game_path(@game) 
            
        else
            render json: { success: false }, status: :unprocessable_entity
        end
        GameChannel.broadcast_to(
            @game,
            "<p class='player-one-#{@game.player_one_id == @clue.user_id}'>#{@clue.user.nickname}: #{@clue.word_clue}</p>"
        )
    end

    private

    def clue_params
        params.require(:clue).permit(:word_clue)
    end
end


# "#{@clue.user.nickname}: #{@clue.word_clue}"