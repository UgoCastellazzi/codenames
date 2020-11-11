class MessagesController < ApplicationController

    def create
        @game = Game.find(params[:game_id])
        @message = Message.new(message_params)
        @message.game = @game
        if @clue.save
            respond_to do |format|
                format.html
                format.json { render json: { success: true } }
            end
            
        else
            render json: { success: false }, status: :unprocessable_entity
        end
        GameChannel.broadcast_to(
            @game,
            @message.content
        )
    end

    private

    def clue_params
        params.require(:message).permit(:content)
    end

end
