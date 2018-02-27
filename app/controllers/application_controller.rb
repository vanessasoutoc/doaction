class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :set_messages

    private 

    def set_messages
        if(current_user.present?)
            @messagesNotRead = Message.where("read = 'f' OR read IS NULL AND receiver_id = ?", current_user.id)
        end
    end


end
