class Message < ApplicationRecord
    belongs_to :user, :foreign_key => 'receiver_id'
    belongs_to :user, :foreign_key => 'sender_id'
end
