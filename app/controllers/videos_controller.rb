class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
    @videos.order(:created_at)
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end


  # GET /videos/1
  # GET /videos/1.json
  def showadmin
    @video = Video.find(params[:id])
  end


  # GET /videos/new
  def new
    @video = Video.new
    @video.concurso_id = params[:concurso_id]
    @concurso = Concurso.find(params[:concurso_id])
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    upload_io =  params[:video][:archivo]
    if upload_io
      prgn = Random.new
      numero_unico = prgn.rand(10000);

      dir_videos = Rails.root.to_s + "/public/originales/"
      path = dir_videos + numero_unico.to_s + "_" + upload_io.original_filename
      File.open(path, 'wb') { |f| f.write(upload_io.read()) }

# transformar el campo archivo (que se empleo en el upload) como un text
      params[:video][:archivo] = "/originales/" + numero_unico.to_s + "_" + upload_io.original_filename
    end
    @video = Video.new(video_params)
    @video.estado = "EN PROCESO"
    @video.fecha = Time.now

    respond_to do |format|
      if @video.save
        @concurso = Concurso.find(@video.concurso_id)
        @video.delay.job_convertir(numero_unico.to_s + "_" + upload_io.original_filename)
        format.html { redirect_to @video, notice: 'Tu video ha subido satisfactoriamente. Esta procesandose.' }
        format.json { render :show, status: :created, location: @video }
      else
        @concurso = Concurso.find(@video.concurso_id)
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  private
  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
    @concurso = Concurso.find(@video.concurso_id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def video_params
    params.require(:video).permit(:nombres, :apellidos, :correo, :fecha, :estado, :archivo, :mensaje, :concurso_id)
  end
end
