class GalleriesController < ApplicationController
	def index
		if (current_usuario!=nil)
			@arrId = Arrendatario.where(usuario_id:current_usuario.id).first.id
		end
		@properties = Property.all()
	end
end
