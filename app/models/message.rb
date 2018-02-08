class Message < ApplicationRecord
    belongs_to :user, :foreign_key => 'receiver_id'
    has_many :users, :foreign_key => 'sender_id'
end
