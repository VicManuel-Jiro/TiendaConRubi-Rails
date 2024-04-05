class CasaproductorasController < ApplicationController
  before_action :set_casaproductora, only: [:show, :edit, :update, :destroy]

  # GET /casaproductoras
  # GET /casaproductoras.json
  def index
    @casaproductoras = Casaproductora.all
  end

  # GET /casaproductoras/1
  # GET /casaproductoras/1.json
  def show
  end

  # GET /casaproductoras/new
  def new
    @casaproductora = Casaproductora.new
  end

  # GET /casaproductoras/1/edit
  def edit
  end

  # POST /casaproductoras
  # POST /casaproductoras.json
  def create
    @casaproductora = Casaproductora.new(nombre: params[:casaproductora][:nombre], fundador: params[:casaproductora][:fundador], ceo: params[:casaproductora][:ceo], sitio: params[:casaproductora][:sitio], telefono: params[:casaproductora][:telefono], atencion_clientes: params[:casaproductora][:atencion_clientes], sede: params[:casaproductora][:sede], twitter: params[:casaproductora][:twitter])
    respond_to do |format|
      if @casaproductora.save
        format.html { redirect_to casaproductoras_path, notice: 'Casa productora creada' }
      else
        format.html { redirect_to casaproductoras_path, notice: 'Error al crear casa productora' }
        
      end
    end
  end

  # PATCH/PUT /casaproductoras/1
  # PATCH/PUT /casaproductoras/1.json
  def update
    @casaproductora=Casaproductora.find(params[:id])
    respond_to do |format|
      if @casaproductora.update(nombre: params[:casaproductora][:nombre], fundador: params[:casaproductora][:fundador], ceo: params[:casaproductora][:ceo], sitio: params[:casaproductora][:sitio], telefono: params[:casaproductora][:telefono], atencion_clientes: params[:casaproductora][:atencion_clientes], sede: params[:casaproductora][:sede], twitter: params[:casaproductora][:twitter])
        format.html { redirect_to casaproductoras_path, notice: 'Casa productora actualizada.' }
      else
        format.html { redirect_to casaproductoras_path, notice: 'No se pudo actualizar la casa productora.' }
      end
    end
  end

  # DELETE /casaproductoras/1
  # DELETE /casaproductoras/1.json
  def destroy
    @casaproductora=Casaproductora.find(params[:id])
    @juego = Juego.where('casa_productora_id=?',params[:id]).first
    respond_to do |format|
      if @juego.nil? 
            if @casaproductora.destroy
              format.html { redirect_to casaproductoras_path, notice: 'Casa productora eliminada.' }
            else
              format.html { redirect_to casaproductoras_path, notice: 'No se pudo eliminar la casa productora.'  }
            end
      else
          format.html { redirect_to casaproductoras_path, notice: 'No se pudo eliminar la Casa productora, hay registros que lo usan.'  }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_casaproductora
      @casaproductora = Casaproductora.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def casaproductora_params
      params.require(:casaproductora).permit(:nombre, :fundador, :ceo, :sitio, :telefono, :atencion_clientes, :sede, :twitter)
    end
end
