class DashboardsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @messagesNotRead = Message.where('receiver_id = ? and read = ?', current_user.id, false)
        @messages = Message.where('receiver_id = ?',current_user.id)
  
    end
end