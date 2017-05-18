class PagesController < ApplicationController

	def index
		@properties = Property.all()
	end
end
