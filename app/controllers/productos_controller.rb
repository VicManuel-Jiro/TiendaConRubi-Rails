class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]

  # GET /productos
  # GET /productos.json
  def index
    @productos = Producto.all
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
  end

  # GET /productos/new
  def new
    @producto = Producto.new
    @proveedor=Proveedor.all
  end

  # GET /productos/1/edit
  def edit
    @proveedor=Proveedor.all
  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'Producto creado.' }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { redirect_to @producto, notice: 'No se pudo crear el producto.' }
      end
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: 'Producto actualizado.' }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { redirect_to @producto, notice: 'No se pudo actualizar el producto.' }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    @producto=Producto.find(params[:id])
    @articulo = Articulo.where('producto_id=?',params[:id]).first
    respond_to do |format|
      if @articulo.nil?
            if @producto.destroy
              format.html { redirect_to productos_url, notice: 'producto eliminado.' }
            else
              format.html { redirect_to productos_url, notice: 'El producto no se pudo eliminar.'  }
            end
      else
          format.html { redirect_to productos_url, notice: 'El producto no se pudo eliminar, hay registros que la usan.'  }
      end
    end
  end
  
def validar_codigo
    @producto = Producto.where('codigo_barras = ?',params[:producto][:codigo_barras]).first
    if @producto.nil?
      validar_codigo = true;
    else
      if (@producto.id).to_i == (params[:producto_id]).to_i
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
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def producto_params
      params.require(:producto).permit(:nombre, :descripcion, :categoria, :color, :existencia, :precio, :descuento, :codigo_barras, :proveedor_id)
    end
end
