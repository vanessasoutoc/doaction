class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :edit, :update, :destroy]

    def index
        @messages = Message.all.order('created_at ASC')
        puts @messages[0].id
    end
    
    # GET /messages/1
    # GET /messages/1.json
    def show
    end

    # GET /notices/new
    def new
        authorize! :new, Message
        @message = Message.new
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
        @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
        params.require(:message).permit(:message, :sender_id, :receiver_id)
    end
end
