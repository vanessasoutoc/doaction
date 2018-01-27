class Ong < ApplicationRecord
    
    has_many :users
    has_one :address, dependent: :destroy, inverse_of: :ong
    
    accepts_nested_attributes_for :address
    

end
