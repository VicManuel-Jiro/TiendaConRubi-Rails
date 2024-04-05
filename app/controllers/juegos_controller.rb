class JuegosController < ApplicationController
  before_action :set_juego, only: [:show, :edit, :update, :destroy]

  # GET /juegos
  # GET /juegos.json
  def index
    @juegos = Juego.all
  end

  # GET /juegos/1
  # GET /juegos/1.json
  def show
  end

  # GET /juegos/new
  def new
    @juego = Juego.new
    @casaproductora=Casaproductora.all
    @plataforma=Plataforma.all
    @consola=Consola.all
  end

  # GET /juegos/1/edit
  def edit
    @casaproductora=Casaproductora.all
    @plataforma=Plataforma.all
    @consola=Consola.all
  end

  # POST /juegos
  # POST /juegos.json
  def create
    @juego = Juego.new(juego_params)

    respond_to do |format|
      if @juego.save
        format.html { redirect_to @juego, notice: 'El juego ha sido creado.' }
        format.json { render :show, status: :created, location: @juego }
      else
        #format.html { redirect_to @juego, notice: 'Error al crear el juego.' }
        format.html { render :new }
        format.json { render json: @juego.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /juegos/1
  # PATCH/PUT /juegos/1.json
  def update
    respond_to do |format|
      if @juego.update(juego_params)
        format.html { redirect_to @juego, notice: 'El juego ha sido actualizado.' }
        format.json { render :show, status: :ok, location: @juego }
      else
        format.html { redirect_to @juego, notice: 'Error al actualizar.' }
      end
    end
  end

  # DELETE /juegos/1
  # DELETE /juegos/1.json
  def destroy
    @juego=Juego.find(params[:id])
    @articulo = Articulo.where('juego_id=?',params[:id]).first
    respond_to do |format|
      if @articulo.nil?
            if @juego.destroy
              format.html { redirect_to juegos_url, notice: 'juego eliminado.' }
            else
              format.html { redirect_to juegos_url, notice: 'El juego no se pudo eliminar.'  }
            end
      else
          format.html { redirect_to juegos_url, notice: 'El juego no se pudo eliminar, hay registros que la usan.'  }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_juego
      @juego = Juego.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def juego_params
      params.require(:juego).permit(:titulo, :plataforma_id, :consola_id, :edicion, :genero, :clasificacion, :casa_productora_id, :existencia, :precio, :descuento, :codigo_barras)
    end
end
