class DashboardsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @messages = Message.where('receiver_id = ?',current_user.id)
  
    end
end