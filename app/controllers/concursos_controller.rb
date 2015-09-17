class ConcursosController < ApplicationController
  before_action :set_concurso, only: [:show, :edit, :update, :destroy]

  # GET /concursos
  # GET /concursos.json
  def index
    @concursos = Concurso.all
  end

  # GET /concursos/1
  # GET /concursos/1.json
  def show
  end

  # GET /concursos/new
  def new
    @concurso = Concurso.new
  end

  # GET /concursos/1/edit
  def edit
  end

  # POST /concursos
  # POST /concursos.json
  def create
    @concurso = Concurso.new(concurso_params)

    respond_to do |format|
      if @concurso.save
        format.html { redirect_to @concurso, notice: 'Concurso was successfully created.' }
        format.json { render :show, status: :created, location: @concurso }
      else
        format.html { render :new }
        format.json { render json: @concurso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concursos/1
  # PATCH/PUT /concursos/1.json
  def update
    respond_to do |format|
      if @concurso.update(concurso_params)
        format.html { redirect_to @concurso, notice: 'Concurso was successfully updated.' }
        format.json { render :show, status: :ok, location: @concurso }
      else
        format.html { render :edit }
        format.json { render json: @concurso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concursos/1
  # DELETE /concursos/1.json
  def destroy
    @concurso.destroy
    respond_to do |format|
      format.html { redirect_to concursos_url, notice: 'Concurso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concurso
      @concurso = Concurso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concurso_params
      params.require(:concurso).permit(:nombre, :banner, :url, :fechaini, :fechafin, :premio)
    end
end
