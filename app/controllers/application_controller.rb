class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :set_messages

    private 

    def set_messages
        if(current_user.present?)
            @messagesNotRead = Message.where('receiver_id = ? and read = ?', current_user.id, false)
        end
    end


end
