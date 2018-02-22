class DashboardsController < ApplicationController
    before_action :authenticate_user!

    def index
        if(current_user.present?)
            @messagesNotRead = Message.where('receiver_id = ? and read = ?', current_user.id, false)
            @messages = Message.joins('LEFT JOIN users ON users.id = messages.receiver_id').where('receiver_id = ?',current_user.id)
            @countUsers = User.count
            @countOngs = Ong.count
            @countMessages = Message.count
            @countCities = Ong.joins(user: :address).where('addresses.city NOTNULL').count
            puts @countCities
        end
    end
end