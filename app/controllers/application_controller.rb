class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :index

    private 
    
    def index
        # @countMessageNotRead = Message.where('receiver_id = ? and read = ?', current_user.id, false).count
        # puts @countMessageNotRead
        
        @messagesNotRead = Message.where('receiver_id = ? and read = ?', current_user.id, false)
    end


end
