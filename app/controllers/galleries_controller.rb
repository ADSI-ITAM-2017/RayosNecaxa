class GalleriesController < ApplicationController
	before_filter :permiso_arrendatario
	def index
		@arrId = Arrendatario.where(usuario_id:current_usuario.id).first.id
		@properties = Property.all()
	end
end
