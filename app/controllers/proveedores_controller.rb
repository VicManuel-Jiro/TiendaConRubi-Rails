class ProveedoresController < ApplicationController
	def inicio
		@proveedores=Proveedor.all 
	end
	def mostrar_proveedores
		@proveedor=Proveedor.find(params[:id]) 
	end
	def nuevo
		@proveedor=Proveedor.new
	end
	def editar
	    @proveedor=Proveedor.find(params[:id])
  	end

	def crear
	  	@proveedor=Proveedor.new(nombre: params[:proveedor][:nombre], paterno: params[:proveedor][:paterno],materno: params[:proveedor][:materno],telefono: params[:proveedor][:telefono],correo: params[:proveedor][:correo],rfc: params[:proveedor][:rfc],direccion: params[:proveedor][:direccion], comision: params[:proveedor][:comision])
	    respond_to do |format|
	      if @proveedor.save
	        format.html { redirect_to proveedores_inicio_path, notice: 'Proveedor creado' }
	      else
	        format.html { redirect_to proveedores_inicio_path, notice: 'Error al crear proveedor' }
	        
	      end
	    end
  	end

  
  def actualizar
    @proveedor=Proveedor.find(params[:proveedor][:id])
    respond_to do |format|
      if @proveedor.update(nombre: params[:proveedor][:nombre], paterno: params[:proveedor][:paterno],materno: params[:proveedor][:materno],telefono: params[:proveedor][:telefono],correo: params[:proveedor][:correo],rfc: params[:proveedor][:rfc],direccion: params[:proveedor][:direccion], comision: params[:proveedor][:comision])
        format.html { redirect_to proveedores_inicio_path, notice: 'Proveedor actualizado.' }
      else
        format.html { redirect_to proveedores_inicio_path, notice: 'El proveedor no se pudo actualizar.' }
      end
    end
  end

  def eliminar
	@proveedor=Proveedor.find(params[:id])
    @producto = Producto.where('proveedor_id=?',params[:id]).first
    respond_to do |format|
      if @producto.nil?
            if @proveedor.destroy
              format.html { redirect_to proveedores_inicio_path, notice: 'Proveedor eliminado.' }
            else
              format.html { redirect_to proveedores_inicio_path, notice: 'El proveedor no se pudo eliminar.'  }
            end
      else
          format.html { redirect_to proveedores_inicio_path, notice: 'El proveedor no se pudo eliminar, hay registros que lo usan.'  }
      end
    end
  end

	def validar_rfc
	    @proveedor=Proveedor.where('rfc = ?',params[:proveedor][:rfc]).first
	    if @proveedor.nil?
	      validar_proveedor = true;
	    else
	      if (@proveedor.id).to_i == (params[:proveedor_id]).to_i
	        validar_proveedor = true;
	      else
	        
	        validar_proveedor = false;
	      end
	    end

	    respond_to do |format|
	    	format.js{render json: { validar: validar_proveedor }, content_type: 'text/json'}
	    end
	end


end