class PublicacionesController < ApplicationController
  before_action :set_concurso, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
  end

  def destroy
  end

  def show
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_concurso
    @concurso = Concurso.find_by(url: params[:nurl])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def concurso_params
    params.require(:concurso).permit(:nombre, :banner, :url, :fechaini, :fechafin, :premio, :administrador_id)
  end
end
