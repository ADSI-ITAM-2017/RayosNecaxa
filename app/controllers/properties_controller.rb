class PropertiesController < ApplicationController
		before_action :authenticate_usuario!

	before_action :permiso_arrendador
	

	def index
		@properties = Property.all()

	end

	def show
		@property = Property.find(params[:id])
	end

	def new
		@property = Property.new
	end

	def create
		#render plain: params[:property].inspect
		if(current_usuario!=nil)
			arr = Arrendador.where(usuario_id:current_usuario.id).first
			@property = Property.new(property_params.merge(arrendador_id: arr.id))
			if(@property.save)
				redirect_to @property
			else
				render 'new'
			end
		end
	end

	def edit
		@property = Property.find(params[:id])

	end

	def update
		@property = Property.find(params[:id])
		if(@property.update(property_params))
			redirect_to @property
		else
			render 'edit'
		end
	end

	def destroy
		@property = Property.find(params[:id])
		@property.destroy
		redirect_to properties_path
	end

	private def property_params
		
		params.require(:property).permit(:title,:price,:description,:image)
	end
end
