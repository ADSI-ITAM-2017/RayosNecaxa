class LikesController < ApplicationController
	def index
		@likes = Like.all()
	end

	def show
		@like = Like.find(params[:id])
	end

	def new
		r=Like.where(propiedad_id: params[:propiedad_id], arrendatario_id: params[:arrendatario_id])
		if(r.count==0)
			@like = Like.new

	end

	def create
		r=Like.where(propiedad_id: params[:propiedad_id], arrendatario_id: params[:arrendatario_id])
		puts 'R: '+r.count.to_s
		if(r.count==0)
			@like = Like.new(like_params)
			@like.save
	end

	def edit
		@like = Like.find(params[:id])
	end

	def update
		@like = Like.find(params[:id])
		if(@like.update(property_params))
			redirect_to @like
		else
			render 'edit'
		end
	end

	def destroy
		@like = Like.find(params[:id])
		@like.destroy
		redirect_to likes_path
	end

	private def like_params
		params.require(:like).permit(:data,:propiedad_id,:arrendatario_id)
	end
end
