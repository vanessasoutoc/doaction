class UsersController < ApplicationController
    #before_filter :authorize_admin, only: :create
    before_action :authenticate_user!
    before_action :set_user, only: [:edit, :update]

    def index
        authorize! :index, User
        if(current_user.role == 'ong')
            @users = User.find(current_user.id)
        end
        if(current_user.role == 'admin')
            @users = User.where('(company_id = ? AND role = ?) OR (company_id = ? AND role = ?) OR (company_id = ? AND role = ?)', current_user.company_id, 'admin', current_user.company_id, 'usuario', current_user.company_id, '').order('name ASC')
        end
        if(current_user.role == 'superadmin')
            @users = User.all.order('name ASC')
        end
    end

    # GET /atendimentos/1
    # GET /atendimentos/1.json
    def show
        authorize! :show, User
        @user = User.find(params[:id])
    end

    # GET /atendimentos/new
    def new
        authorize! :new, User
        @user = User.new
    end

    # GET /atendimentos/1/edit
    def edit
        authorize! :edit, User
        @user = User.find(params[:id])
    end

    def edit_my_data 
        @user = current_user
        render 'edit_my_data'
    end

    def import
        @result = User.import(params[:file], current_user)
        if (@result == true)
            puts 'import'
            flash[:success] = 'Usuários importados com sucesso!'
            redirect_to users_url 
        else
            if @result.index('Illegal')
                flash[:error] = 'Formato de arquivo deve ser .csv'
                redirect_to users_url 
            else
                flash[:error] = @result
                redirect_to users_url    
            end

        end
    end


    def create
        authorize! :create, User
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                flash[:success] = 'Usuário cadastrado com sucesso!'
                format.html { redirect_to users_url }
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end 
    end
    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
        authorize! :update, User
        respond_to do |format|
            if @user.update(user_params)
                flash[:success] = 'Usuário alterado com sucesso!'
                format.html { redirect_to users_url }
                format.json { render :show, status: :ok, location: @user }
            else
                format.html { render :edit }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    def update_my_data
        @user = current_user
        respond_to do |format|
            if @user.update(user_params)
                flash[:success] = 'Seus dados foram alterados com sucesso!'
                format.html { redirect_to edit_my_user_path }
                format.json { render :show, status: :ok, location: @user }
            else
                format.html { render :edit }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        authorize! :destroy, User
        @user = User.find(params[:id])
        if @user.present?
            @user.destroy
            respond_to do |format|
                flash[:success] = 'Usuário deletado com sucesso!'
                format.html { redirect_to users_url }
                format.json { head :no_content }
            end
        end

    end

    private

    # This should probably be abstracted to ApplicationController
    # as shown by diego.greyrobot

    def set_user
        @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
        params.require(:user).permit(:name, :image, :email, :password, :password_confirmation, :role, {ong_attributes: [:id,:name, :name_fantasy, :cnpj]}, {address_attributes: [:id, :street, :number, :neighborhood, :complement, :zipcode, :city, :state ]} )
    end
end
