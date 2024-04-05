class PlataformasController < ApplicationController
	def inicio
		@plataformas=Plataforma.all 
	end
	def mostrar_plataformas
		@plataforma=Plataforma.find(params[:id]) 
	end
	def nuevo
		@plataforma=Plataforma.new
	end
	def editar
	    @plataforma=Plataforma.find(params[:id])
  	end

	def crear
	  	@plataforma=Plataforma.new(nombre: params[:plataforma][:nombre], empresa: params[:plataforma][:empresa],tipo_empresa: params[:plataforma][:tipo_empresa],tipo: params[:plataforma][:tipo],tipo_dispositivo: params[:plataforma][:tipo_dispositivo],sitio: params[:plataforma][:sitio],fundador: params[:plataforma][:fundador], sede: params[:plataforma][:sede],ceo: params[:plataforma][:ceo])
	    respond_to do |format|
	      if @plataforma.save
	        format.html { redirect_to plataformas_inicio_path, notice: 'Plataforma creado' }
	      else
	        format.html { redirect_to plataformas_inicio_path, notice: 'Error al crear plataforma' }
	        
	      end
	    end
  	end

  
  def actualizar
    @plataforma=Plataforma.find(params[:plataforma][:id])
    respond_to do |format|
      if @plataforma.update(nombre: params[:plataforma][:nombre], empresa: params[:plataforma][:empresa],tipo_empresa: params[:plataforma][:tipo_empresa],tipo: params[:plataforma][:tipo],tipo_dispositivo: params[:plataforma][:tipo_dispositivo],sitio: params[:plataforma][:sitio],fundador: params[:plataforma][:fundador], sede: params[:plataforma][:sede],ceo: params[:plataforma][:ceo])
        format.html { redirect_to plataformas_inicio_path, notice: 'Plataforma actualizada.' }
      else
        format.html { redirect_to plataformas_inicio_path, notice: 'Error al actualizar.' }
      end
    end
  end

  def eliminar
	@plataforma=Plataforma.find(params[:id])
    @juego = Juego.where('plataforma_id=?',params[:id]).first
    @consola = Consola.where('plataforma_id=?',params[:id]).first
    respond_to do |format|
      if @juego.nil? && @consola.nil?
            if @plataforma.destroy
              format.html { redirect_to plataformas_inicio_path, notice: 'Plataforma eliminado.' }
            else
              format.html { redirect_to plataformas_inicio_path, notice: 'Error al eliminar.'  }
            end
      else
          format.html { redirect_to plataformas_inicio_path, notice: 'La plataforma no se pudo eliminar, hay registros que lo usan.'  }
      end
    end
  end

	def validar_plataforma
	    @plataforma=Plataforma.where('nombre = ?',params[:plataforma][:nombre]).first
	    if @plataforma.nil?
	      validar_plataforma = true;
	    else
	      if (@plataforma.id).to_i == (params[:plataforma_id]).to_i
	        validar_plataforma = true;
	      else
	        
	        validar_plataforma = false;
	      end
	    end

	    respond_to do |format|
	    	format.js{render json: { validar: validar_plataforma }, content_type: 'text/json'}
	    end
	end


end