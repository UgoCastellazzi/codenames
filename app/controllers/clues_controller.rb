class CluesController < ApplicationController

    def create
        @game = Game.find(params[:game_id])
        @clue = Clue.new(clue_params)
        @clue.game = @game
        @clue.user = current_user
        if @clue.save
            redirect_to game_path(@game)
        else
            render "games/show"
        end
        GameChannel.broadcast_to(
            @game,
            render_to_string(partial: "clue", locals: { clue: @clue })
        )
    end

    private

    def clue_params
        params.require(:clue).permit(:number_clue, :word_clue)
    end
end
