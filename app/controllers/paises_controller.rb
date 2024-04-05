class PaisesController < ApplicationController
  def inicio
  	@paises=Pais.all
  end
  def mostrar_paises
  	@pais=Pais.find(params[:id]) 
  end
  def nuevo
  	@pais=Pais.new
  end
  def crear
  	@pais = Pais.new(nombre: params[:pais][:nombre], descripcion: params[:pais][:descripcion])
    respond_to do |format|
      if @pais.save
        format.html { redirect_to paises_inicio_path, notice: 'Pais creado' }
      else
        format.html { render :new }
        
      end
    end
  end
  def editar
    @pais=Pais.find(params[:id])
  end
  def actualizar
    @pais=Pais.find(params[:pais][:id])
    respond_to do |format|
      if @pais.update(nombre: params[:pais][:nombre],descripcion:params[:pais][:descripcion])
        format.html { redirect_to paises_inicio_path, notice: 'Pais actualizado.' }
      else
        format.html { redirect_to paises_inicio_path, notice: 'No se pudo actualizar el pais.' }
      end
    end
  end

  def eliminar
    @pais=Pais.find(params[:id])
    @estado = Estado.where('pais_id=?',params[:id]).first
    respond_to do |format|
      if @estado.nil?
          if @pais.destroy
             format.html { redirect_to paises_inicio_path, notice: 'Pais eliminado.' }
          else
             format.html { redirect_to paises_inicio_path, notice: 'No se pudo eliminar el pais.'  }
          end
      else
          format.html { redirect_to paises_inicio_path, notice: 'No se pudo eliminar el pais, hay registros que lo usan.'  }
      end
    end
  end

end

