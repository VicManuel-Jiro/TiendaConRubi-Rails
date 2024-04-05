class SucursalesController < ApplicationController
	def inicio
		@sucursales=Sucursal.all 
	end
	def mostrar_sucursales
		@sucursal=Sucursal.find(params[:id]) 
	end
	def nuevo
		@sucursal=Sucursal.new
		@estados=Estado.all
	end
	def editar
	    @sucursal=Sucursal.find(params[:id])
	    @estados=Estado.all
  	end

	def crear
	  	@sucursal=Sucursal.new(estado_id: params[:sucursal][:estado_id], calle: params[:sucursal][:calle],numero: params[:sucursal][:numero],nombre: params[:sucursal][:nombre],no_identificador: params[:sucursal][:no_identificador])
	    respond_to do |format|
	      if @sucursal.save
	        format.html { redirect_to sucursales_inicio_path, notice: 'Sucursal creada' }
	      else
	        format.html { redirect_to sucursales_inicio_path, notice: 'Error al crear sucursal' }
	        
	      end
	    end
  	end

  
  def actualizar
    @sucursal=Sucursal.find(params[:sucursal][:id])
    respond_to do |format|
      if @sucursal.update(estado_id: params[:sucursal][:estado_id], calle: params[:sucursal][:calle],numero: params[:sucursal][:numero],nombre: params[:sucursal][:nombre],no_identificador: params[:sucursal][:no_identificador])
        format.html { redirect_to sucursales_inicio_path, notice: 'Sucursal actualizada.' }
      else
        format.html { redirect_to sucursales_inicio_path, notice: 'La sucursal no se pudo actualizar.' }
      end
    end
  end

  def eliminar
    @sucursal=Sucursal.find(params[:id])
    @pedido = Pedido.where('sucursal_id=?',params[:id]).first
    respond_to do |format|
      if @pedido.nil?
            if @sucursal.destroy
              format.html { redirect_to sucursales_inicio_path, notice: 'Sucursal eliminado.' }
            else
              format.html { redirect_to sucursales_inicio_path, notice: 'La sucursal no se pudo eliminar.'  }
            end
      else
          format.html { redirect_to sucursales_inicio_path, notice: 'La sucursal no se pudo eliminar, hay registros que lo usan.'  }
      end
    end
  end

	def validar_sucursal
	    @sucursal=Sucursal.where('no_identificador = ?',params[:sucursal][:nombre]).first
	    if @sucursal.nil?
	      validar_sucursal = true;
	    else
	      if (@sucursal.id).to_i == (params[:sucursal_id]).to_i
	        validar_sucursal = true;
	      else
	        
	        validar_sucursal = false;
	      end
	    end

	    respond_to do |format|
	    	format.js{render json: { validar: validar_sucursal }, content_type: 'text/json'}
	    end
	end


end