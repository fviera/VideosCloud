# Controlador para crear login de los administradores
# Fecha: 21/09/2015
# Version: 0.9
# Autores: Cristo Rodriguez / Fredy Viera
#

class SesionController < ApplicationController
  def new
  end

  def create
    usuario = Administrador.find_by(usuario: params[:name])
    password = params[:password]
    if usuario and password == usuario.password
#      session[:user_id] = user.id
      redirect_to '/administradors/'+usuario.id.to_s
    else
      redirect_to "/sesion/new", alert: "Usuario o password invalidos"
    end
  end

  def destroy
#    session[:user_id] = nil
    redirect_to logout_path, notice: "Logged out"
  end
end
