class SesionesController < ApplicationController
	layout 'application_login'
	skip_before_action :login?, only:[:login, :validar]
  def login
  	session[:usuario_id]=nil
  end
  def cerrar_sesion
  	session[:usuario_id]=nil
  	session[:nombre]=nil
  	respond_to do |format|
  		format.html{redirect_to login_path, alert: 'Sesion finalizada.'}
  	end
  	
  end
  def validar
  	values = {}
    values[:login]=params[:usuario]
    values[:password]=params[:password]
    #@usuario = Usuario.where('login=? and password=?', params[:login],params[:password]).first
    @usuario = Usuario.where(values).first
    if @usuario.nil?
    	validar = false
    else
    	validar=true
    	session[:usuario_id]= @usuario.id
    	session[:nombre]= @usuario.nombre+' '+@usuario.paterno+' '+@usuario.materno
    end
    respond_to do |format|
   		if validar
      		format.html { redirect_to inicio_path}
        else
        	format.html { redirect_to login_path, alert: 'usuario o password incorrectos' }
        end
    end
  end
end
