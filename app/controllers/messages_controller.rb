class MessagesController < ApplicationController

    def create
        @game = Game.find(params[:game_id])
        @message = Message.new(messages_params)
        @message.game = @game
        @word = Word.find(id = @message.word_id)
        @word.reveal
        words = @game.words
        new_words = words.map{ |word| word == @word ? @word : word }
        @game.update({ words: new_words})
        if @message.save
            respond_to do |format|
                format.html
                format.json { render json: { success: true } }
            end
            
        else
            render json: { success: false }, status: :unprocessable_entity
        end
        GameChannel.broadcast_to(
            @game,
            { content: @message.content, word_id: @message.word_id }
        )
    end

    private

    def messages_params
        params.require(:message).permit(:content, :word_id)
    end

end
