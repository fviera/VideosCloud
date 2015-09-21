class Video < ActiveRecord::Base
  belongs_to :concurso
  include ActiveModel::Validations
  class CorreoValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add attribute, (options[:message] || "no es valido ej. xxx@yyy.zzz") unless
          value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    end
  end
  validates :archivo, :mensaje, presence: true
  validates :nombres, presence: true,length: { maximum: 30 }
  validates :apellidos, presence: true,length: { maximum: 100 }
  validates :correo, presence: true, correo: true


  def job_convertir(nombre_archivo_original)
    self.fechainiconversion = Time.now
    prgn = Random.new
    numero_unico = prgn.rand(10000);

    dir_videos = Rails.root.to_s + "/public/originales/"
    dir_videos_convertidos = Rails.root.to_s  + "/public/"

    path_original = dir_videos + nombre_archivo_original
    sustituir_ext = nombre_archivo_original.sub /\.[^.]+\z/, ".mp4"
    nombre_archivo_convertido = numero_unico.to_s + "_" + sustituir_ext
    path_convertido = dir_videos_convertidos + nombre_archivo_convertido

    movie = FFMPEG::Movie.new(path_original)

    options = {video_codec: "libx264", x264_profile: "high", x264_preset: "slow",
               audio_bitrate: 32, audio_sample_rate: 22050, audio_channels: 1,
               threads: 2}
    movie.transcode(path_convertido, options)

    self.archivoconvertido = "/" + nombre_archivo_convertido
    self.estado = "CONVERTIDO"
    self.fechafinconversion = Time.now
    self.save
    UserMailer.send_signup_email(self).deliver
  end
end
