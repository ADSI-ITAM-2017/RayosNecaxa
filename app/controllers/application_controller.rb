class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
protect_from_forgery with: :null_session

    before_action :configure_permitted_parameters, if: :devise_controller?

    helper_method :rol_usuario,:permiso_arrendador,:permiso_arrendatario,:flash_class

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre,:apellido,:rol])
  end

  def permiso_arrendador
    if(current_usuario!= nil && !current_usuario.blank?)
    	@rolUsuario = Usuario.where(id:current_usuario.id).first.rol
    	if(@rolUsuario != 'Arrendador' || current_usuario.blank?)
  		    redirect_to('/')
      end
    else
        redirect_to('/')
    end

  end


  def permiso_arrendatario
    if(current_usuario!= nil && !current_usuario.blank?)
        @rolUsuario = Usuario.where(id:current_usuario.id).first.rol
        if(@rolUsuario != 'Arrendatario')
            redirect_to('/')
        end
    else
        redirect_to('/')
    end

    end

  def rol_usuario 
      if(current_usuario!= nil && !current_usuario.blank?)
      return Usuario.where(id:current_usuario.id).first.rol
    end
  end

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end

end
