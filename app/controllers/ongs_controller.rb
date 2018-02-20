class OngsController < ApplicationController
    before_action :set_ong, only: [:show, :edit, :update, :destroy, :message]
    #before_action :authenticate_user!


    # GET /companies
    # GET /companies.json
    def index
        @messagesNotRead = Message.where('receiver_id = ? and read = ?', current_user.id, false)
        @ongs = Ong.joins(user: :address)
    end

    # GET /companies/1
    # GET /companies/1.json
    def show
    end

    # GET /companies/new
    def new
        @ong = Ong.new
        @ong.adress.new
    end

    # GET /companies/1/edit
    def edit
    end

    # POST /companies
    # POST /companies.json
    def create
        @ong = Ong.new(ong_params)
        respond_to do |format|
            if @ong.save
                format.html { redirect_to @ong, flash: { success: 'Ong cadastrada com sucesso.' }}
                format.json { render :show, status: :created, location: @ong }
            else
                format.html { render :new }
                format.json { render json: @ong.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /companies/1
    # PATCH/PUT /companies/1.json
    def update
        respond_to do |format|
            if @ong.update(ong_params)
                format.html { redirect_to @ong, :flash => {:success => 'Ong alterada com sucesso.'}}
                format.json { render :show, status: :ok, location: @ong }
            else
                format.html { render :edit }
                format.json { render json: @ong.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /companies/1
    # DELETE /companies/1.json
    def destroy
        @ong.destroy
        respond_to do |format|
            format.html { redirect_to ongs_url, :flash => {:success => 'Ong excluída com sucesso.'}}
            format.json { head :no_content }
        end
    end

    def message
        #@ong = Ong.find(params[:id])
        puts @ong.name
    end

    def send_message
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_ong
        @ong = Ong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ong_params
        params.require(:ong).permit(:name, :fantasy_name, :cnpj, :image, users_attributes:[:id, :name, :email, :birth, :password, :password_confirmation, :ong_id, :role], address_attributes: [:street, :number, :neighborhood, :complement, :zipcode, :city_id])
    end
end
