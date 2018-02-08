class User < ApplicationRecord
    
    belongs_to :ong, optional: true
    belongs_to :address, optional: true
    #belongs_to :ong, inverse_of: :users, :class_name => 'Ong', :foreign_key => 'ong_id'

    accepts_nested_attributes_for :ong
    accepts_nested_attributes_for :address

    validates :email, presence: true, uniqueness: {scope: :ong_id}

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

    include DeviseTokenAuth::Concerns::User
    devise :omniauthable
    ROLES = %w[admin usuario ong].freeze

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.name = auth.info.name
            user.password = Devise.friendly_token[0,20]
            user.image = auth.info.image
        end
    end


    #before_validation :create_ong

    # Here we creating account and assing account_id to user
=begin
        def create_ong
            @ong = Ong.new
            if @ong.save
                self.ong = @ong.id
            end
        end 
=end


end
