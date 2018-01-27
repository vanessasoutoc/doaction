class Ong < ApplicationRecord
    
    has_one :user
    #has_one :address, dependent: :destroy, inverse_of: :ong
    
    #accepts_nested_attributes_for :address
    

end
