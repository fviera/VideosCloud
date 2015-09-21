class UserMailer < ActionMailer::Base
  default from: "videos7865@gmail.com"

  def send_signup_email(video)
    @video = video
    mail( :to => @video.correo,
          :subject => 'Su video ya se encuentra procesado. Gracias por participar.' )
  end
end
