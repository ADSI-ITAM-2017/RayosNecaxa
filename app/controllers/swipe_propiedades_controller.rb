class SwipePropiedadesController < ApplicationController
  def index
    @a=1
    @propiedad = Propiedad.all
  end

  def new
    @reservacion=Reservacion.new
  end

  def create
    @reservacion=Reservacion.new
    @reservacion.fechaini= @fini
    @reservacion.fechafin= @ff
    @reservacion.arrendatario_id= @aid
    @reservacion.propiedad_id= @pid
    if @reservacion.save
      render :index
    end
  end


    #def show
    #end



    #def edit
    #end

    #def update
    #end

    #def destroy
    #end
end
