class EstadosController < ApplicationController
  def inicio
  	@estados=Estado.all #**Select * from estados*/
  end
  def mostrar_estados
  	@estado=Estado.find(params[:id]) #select * from estados where estado_id=1
  end
  def nuevo
  	@estado=Estado.new
    @paises=Pais.all
  end
  def crear
  	@estado = Estado.new(nombre: params[:estado][:nombre], descripcion: params[:estado][:descripcion], pais_id: params[:estado][:pais_id])
    respond_to do |format|
      if @estado.save
        format.html { redirect_to estados_inicio_path, notice: 'Estado creado' }
      else
        format.html { redirect_to estados_inicio_path, notice: 'Error al crear estado' }
        
      end
    end
  end
  def editar
    @estado=Estado.find(params[:id]) #where('id=?',params[:id]).first
    @paises=Pais.all
  end
  def actualizar
    @estado=Estado.find(params[:estado][:id])
    respond_to do |format|
      if @estado.update(nombre: params[:estado][:nombre],descripcion:params[:estado][:descripcion],pais_id:params[:estado][:pais_id])
        format.html { redirect_to estados_inicio_path, notice: 'Estado actualizado.' }
      else
        format.html { redirect_to estados_inicio_path, notice: 'No se pudo actualizar el estado.' }
      end
    end
  end

  def eliminar
    @estado=Estado.find(params[:id])
    @usuario = Usuario.where('estado_id=?',params[:id]).first
    @cliente= Cliente.where('estado_id=?',params[:id]).first
    @sucursal=Sucursal.where('estado_id=?',params[:id]).first
    respond_to do |format|
      if @usuario.nil? && @cliente.nil? && @sucursal.nil?
            if @estado.destroy
              format.html { redirect_to estados_inicio_path, notice: 'Estado eliminado.' }
            else
              format.html { redirect_to estados_inicio_path, notice: 'No se pudo eliminar el estado.'  }
            end
      else
          format.html { redirect_to estados_inicio_path, notice: 'No se pudo eliminar el Estado, hay registros que lo usan.'  }
      end
    end
  end

end

