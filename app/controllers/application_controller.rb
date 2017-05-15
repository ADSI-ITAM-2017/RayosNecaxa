class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
protect_from_forgery with: :null_session

    before_action :configure_permitted_parameters, if: :devise_controller?

    helper_method :rol_usuario

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre,:apellido,:rol])
  end

  def permiso_arrendador
  	@rolUsuario = Usuario.where(id:current_usuario.id).first.rol
  	if(@rolUsuario != 'Arrendador' || current_usuario.blank?)
		    redirect_to('/')
    end
  end
  def permiso_arrendatario
    @rolUsuario = Usuario.where(id:current_usuario.id).first.rol
    if(@rolUsuario != 'Arrendatario' || current_usuario.blank?)
        redirect_to('/')
    end
  end
  def rol_usuario 
      if(!current_usuario.blank?)
      return Usuario.where(id:current_usuario.id).first.rol
    end
  end

end
