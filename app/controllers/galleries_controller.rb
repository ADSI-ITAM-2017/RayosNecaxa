class GalleriesController < ApplicationController
	before_action :authenticate_usuario!
	before_action :permiso_arrendatario
	def index
		if (current_usuario!=nil)
			@arrId = Arrendatario.where(usuario_id:current_usuario.id).first.id
		end
		@properties = Property.all()
	end
end
