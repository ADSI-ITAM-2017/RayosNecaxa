class ReservacionsController < ApplicationController
	before_action :authenticate_usuario!
	def index
		@reservaciones = Reservacion.all()
	end

	def show
		@reservacion = Reservacion.find(params[:id])
	end

	def new
		@usuarios = Usuario.where.not(id: current_usuario.id)
		@reservacion = Reservacion.new
	end

	def create
		if(current_usuario!=nil)
			if(current_usuario.rol == 'Arrendador')
				arr = Arrendador.where(usuario_id:current_usuario.id).first
			else
				arr = Arrendatario.where(usuario_id:current_usuario.id).first
			end
			id2 = dameIdArrUsr(params[:res][:usr].to_i)
			if(current_usuario.rol == 'Arrendador')
				tipo = {id_arrendador: arr.id,id_arrendatario: id2}

			else
				tipo = {id_arrendatario: arr.id,id_arrendador: id2}
			end
			@reservacion = Reservacion.new(reservacion_params.merge(tipo))
			if(@reservacion.save)
				redirect_to @reservacion
			else
				render 'new'
			end
		end
	end

	def edit
		@reservacion = Reservacion.find(params[:id])

	end

	def update
		@reservacion = Reservacion.find(params[:id])
		if(@reservacion.update(reservacion_params))
			redirect_to @reservacion
		else
			render 'edit'
		end
	end

	def destroy
		@reservacion = Reservacion.find(params[:id])
		@reservacion.destroy
		redirect_to reservacion_path
	end

	private def reservacion_params
		
		params.require(:res).permit(:fechaIni,:fechaFin)
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
