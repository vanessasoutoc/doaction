class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :edit, :update, :destroy]

    def index
        @messages = Message.all.order('created_at ASC')
    end

    # GET /messages/1
    # GET /messages/1.json
    def show
    end

    # GET /notices/new
    def new
        #authorize! :new, Message
        @messagesNotRead = Message.where('receiver_id = ? and read = ?', current_user.id, false)
        @userReceiver = User.find(params[:id])
        if @userReceiver.ong_id != nil
            @ong = Ong.find(@userReceiver.ong_id)
        end
        @oldMessages = Message.where('sender_id = ? or receiver_id = ? ', current_user.id, @userReceiver.id)
        @message = Message.new
    end

    def create 
        @message = Message.new(message_params)
        @user = User.find(@message.sender_id)
        if @user.ong_id != nil
            @ong = Ong.find(@user.ong_id)
        end 
        respond_to do |format|
            if @message.save
                format.html { redirect_to new_path(@user), flash: { success: 'Ong cadastrada com sucesso.' }}
                format.json { render :show, status: :created, location: @message }
            else
                format.html { render :new }
                format.json { render json: @message.errors, status: :unprocessable_entity }
            end
        end

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
