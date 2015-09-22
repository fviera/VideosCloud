# Controlador de la entidad Administrador
# Fecha: 21/09/2015
# Version: 0.9
# Autores: Cristo Rodriguez / Fredy Viera
#
  class AdministradorsController < ApplicationController
  before_action :set_administrador, only: [:show, :edit, :update, :destroy]

  # GET /administradors
  # GET /administradors.json
  def index
    @administradors = Administrador.all.paginate(:page => params[:page], :per_page => 20)
  end

  # GET /administradors/1
  # GET /administradors/1.json
  def show
  end

  # GET /administradors/new
  def new
    @administrador = Administrador.new
  end

  # GET /administradors/1/edit
  def edit
  end

  # POST /administradors
  # POST /administradors.json
  def create
    @administrador = Administrador.new(administrador_params)

    respond_to do |format|
      if @administrador.password != @administrador.password_adicional
        @administrador.errors.add :password, ("La comprobacion del password fallo")
        format.html { render :new }
        format.json { render json: @administrador.errors, status: :unprocessable_entity }
      else
        if @administrador.save
          format.html { redirect_to @administrador, notice: 'Administrador ha sido creado correctamente.' }
          format.json { render :show, status: :created, location: @administrador }
        else
          format.html { render :new }
          format.json { render json: @administrador.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /administradors/1
  # PATCH/PUT /administradors/1.json
  def update
    respond_to do |format|
      if @administrador.update(administrador_params)
        format.html { redirect_to @administrador, notice: 'Administrador ha sido actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @administrador }
      else
        format.html { render :edit }
        format.json { render json: @administrador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administradors/1
  # DELETE /administradors/1.json
  def destroy
    @administrador.destroy
    respond_to do |format|
      format.html { redirect_to administradors_url, notice: 'Administrador ha sido eleminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrador
      @administrador = Administrador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrador_params
      params.require(:administrador).permit(:nombres, :apellidos, :correo, :empresa, :usuario, :password, :password_adicional)
    end
end
