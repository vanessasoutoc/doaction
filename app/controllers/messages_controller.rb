class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @messages = Message.all.order('created_at ASC')
    end

    # GET /messages/1
    # GET /messages/1.json
    def show
    end

    # GET /messages/new/:idusuarioreceiver
    def new

        @userReceiver = User.find(params[:id])
        if @userReceiver.ong_id != nil
            @ong = Ong.find(@userReceiver.ong_id)
        end
        @oldMessages = Message.where('sender_id = ? or receiver_id = ? AND receiver_id = ? or sender_id =? ', current_user.id, @userReceiver.id, current_user.id, @userReceiver.id)
        @message = Message.new

    end

    def create 
        @message = Message.new(message_params)
        @userReceiver = User.find(@message.receiver_id)
        if @userReceiver.ong_id != nil
            @ong = Ong.find(@userReceiver.ong_id)
        end 
        respond_to do |format|
            if @message.save
                format.json { render json: @userReceiver }
                format.html { redirect_to new_path(@userReceiver)}
                format.json { render :show, status: :created, location: @message }
            else
                format.html { render :new }
                format.json { render json: @message.errors, status: :unprocessable_entity }
            end
        end

    end

    def newresponse

        @userReceiver = User.find(params[:id])
        if @userReceiver.ong_id != nil
            @ong = Ong.find(@userReceiver.ong_id)
        end
        @oldMessages = Message.where('sender_id = ? or receiver_id = ? AND receiver_id = ? or sender_id =? ', current_user.id, @userReceiver.id, current_user.id, @userReceiver.id)
        @message = Message.new

    end


    def createresponse 
        @message = Message.new(message_params)
        @userReceiver = User.find(@message.receiver_id)
        if @userReceiver.ong_id != nil
            @ong = Ong.find(@userReceiver.ong_id)
        end 
        respond_to do |format|
            if @message.save
                format.json { render json: @userReceiver }
                format.html { redirect_to newresponse_path(@userReceiver)}
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
