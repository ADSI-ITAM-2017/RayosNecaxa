class MensajesController < ApplicationController
	before_action :authenticate_usuario!
	def index
		@mensajes = Mensaje.all()
	end

	def show
		@mensaje = Mensaje.find(params[:id])
	end

	def new
		@usuarios = Usuario.where.not(id: current_usuario.id)
		@mensaje = Mensaje.new
	end

	def create
		if(current_usuario!=nil)
			if(current_usuario.rol == 'Arrendador')
				arr = Arrendador.where(usuario_id:current_usuario.id).first
			else
				arr = Arrendatario.where(usuario_id:current_usuario.id).first
			end
			id2 = dameIdArrUsr(params[:mens][:usr].to_i)
			if(current_usuario.rol == 'Arrendador')
				tipo = {id_arrendador: arr.id,id_arrendatario: id2}

			else
				tipo = {id_arrendatario: arr.id,id_arrendador: id2}
			end
			@mensaje = Mensaje.new(mensaje_params.merge(tipo))
			if(@mensaje.save)
				redirect_to @mensaje
			else
				render 'new'
			end
		end
	end

	def edit
		@mensaje = Mensaje.find(params[:id])

	end

	def update
		@mensaje = Mensaje.find(params[:id])
		if(@mensaje.update(mensaje_params))
			redirect_to @mensaje
		else
			render 'edit'
		end
	end

	def destroy
		@mensaje = Mensaje.find(params[:id])
		@mensaje.destroy
		redirect_to mensajes_path
	end

	private def mensaje_params
		
		params.require(:mens).permit(:titulo,:horaEnvio,:mensaje)
	end
	private def dameIdArrUsr(idUsr)
		if(current_usuario!= nil && !current_usuario.blank?)
      		rol = Usuario.find(idUsr).rol
      		if (rol == 'Arrendador')
      			return Arrendador.where(usuario_id:idUsr).first.id
      		else
      			return Arrendatario.where(usuario_id:idUsr).first.id
      		end
		end
	end
end
