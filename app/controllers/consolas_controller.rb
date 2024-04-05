class ConsolasController < ApplicationController
  before_action :set_consola, only: [:show, :edit, :update, :destroy]

  # GET /consolas
  # GET /consolas.json
  def index
    @consolas = Consola.all
  end

  # GET /consolas/1
  # GET /consolas/1.json
  def show
  end

  # GET /consolas/new
  def new
    @consola = Consola.new
    @plataformas=Plataforma.all
  end

  # GET /consolas/1/edit
  def edit
    @plataformas=Plataforma.all
  end

  # POST /consolas
  # POST /consolas.json
  def create
    @consola = Consola.new(consola_params)

    respond_to do |format|
      if @consola.save
        format.html { redirect_to @consola, notice: 'Consola creada.' }
        format.json { render :show, status: :created, location: @consola }
      else
        format.html { redirect_to @consola, notice: 'No se pudo crear la Consola.' }
      end
    end
  end

  # PATCH/PUT /consolas/1
  # PATCH/PUT /consolas/1.json
  def update
    respond_to do |format|
      if @consola.update(consola_params)
        format.html { redirect_to @consola, notice: 'Consola actualizada.' }
        format.json { render :show, status: :ok, location: @consola }
      else
        format.html { redirect_to @consola, notice: 'No se pudo actualizar la Consola.' }
      end
    end
  end

  # DELETE /consolas/1
  # DELETE /consolas/1.json
  def destroy
    @consola=Consola.find(params[:id])
    @articulo = Articulo.where('consola_id=?',params[:id]).first
    respond_to do |format|
      if @articulo.nil?
            if @consola.destroy
              format.html { redirect_to consolas_url, notice: 'Consola eliminada.' }
            else
              format.html { redirect_to consolas_url, notice: 'La consola no se pudo eliminar.'  }
            end
      else
          format.html { redirect_to consolas_url, notice: 'La consola no se pudo eliminar, hay registros que la usan.'  }
      end
    end
  end

  def validar_codigo
    @consola = Consola.where('codigo_barras = ?',params[:consola][:codigo_barras]).first
    if @consola.nil?
      validar_codigo = true;
    else
      if (@consola.id).to_i == (params[:consola_id]).to_i
        validar_codigo = true;
      else
        
        validar_codigo = false;
      end
    end
        respond_to do |format|
          format.js{render json: { validar: validar_codigo }, content_type: 'text/json'}
        end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consola
      @consola = Consola.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consola_params
      params.require(:consola).permit(:nombre, :plataforma_id, :color, :edicion, :capacidad, :existencia, :precio, :descuento, :codigo_barras)
    end
end
