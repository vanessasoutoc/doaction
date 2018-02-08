class RegistrationsController < Devise::RegistrationsController  

 # Because of Rails strong parameter we need to use the Registration controller Override
 # to sanitize inputs
 # Devise automatically knows wich one to use
 
 private
  def sign_up_params
    params.require(:user).permit( :email, :name, :password, :password_confirmation, :role,
	ong_attributes:[:name, :name_fantasy, :cnpj, :cnpj], address_attributes: [:street, :number, :neighborhood, :complement, :zipcode, :city_id ])
  end
 
  def account_update_params
    # For updates we make sure to let the Company ID pass through or the form will 
	# generate a new company every time we edit our details
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :current_password,
	ong_attributes:[:id, :name, :name_fantasy, :cnpj, address_attributes: [:street, :number, :neighborhood, :complement, :zipcode, :city_id ]])
  end
end