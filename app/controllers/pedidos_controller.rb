class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.all.order('id DESC')
  #  if params[:nombre].present?
  #    @productos=Producto.where("nombre LIKE ?", "%" + params[:nombre] + "%")#where('nombre LIKE ?', values).all#where(values)#.where('name LIKE ?', '%egm%').all
  #    @consolas=Consola.where("nombre LIKE ?", "%" + params[:nombre] + "%")#where('nombre LIKE ?', values).all#where(values)
  #    @juegos=Juego.where("titulo LIKE ?", "%" + params[:nombre] + "%")#where('titulo LIKE ?', values).all#where(values)
  #  else
  #    @productos=Producto.all
  #    @consolas=Consola.all
  #    @juegos=Juego.all
  #  end
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end
  def crear
    if params[:codigo_barras].present?
      @productos=Producto.where(codigo_barras: params[:codigo_barras]).first#.find(params[:codigo_barras])#where("nombre LIKE ?", "%" + params[:nombre] + "%")#where('nombre LIKE ?', values).all#where(values)#.where('name LIKE ?', '%egm%').all
      @consolas=Consola.where(codigo_barras: params[:codigo_barras]).first#.find(params[:codigo_barras])#where("nombre LIKE ?", "%" + params[:nombre] + "%")#where('nombre LIKE ?', values).all#where(values)
      @juegos=Juego.where(codigo_barras: params[:codigo_barras]).first#where("titulo LIKE ?", "%" + params[:nombre] + "%")#where('titulo LIKE ?', values).all#where(values)
      if @productos.nil?  && @consolas.nil? && @juegos.nil?
        respond_to do |format|
          format.html { redirect_to inicio_path, notice: 'No se encontro el codigo de barras.' }
        end
      else
        @articulo=Articulo.new
        if @productos.nil? && @consolas.nil?
          @articulo = Articulo.new(juego_id: @juegos.id)
          @juegos.update(existencia: @juegos.existencia-1)
        elsif @productos.nil? && @juegos.nil?
          @articulo = Articulo.new(consola_id: @consolas.id)
          @consolas.update(existencia: @consolas.existencia-1)
        elsif @juegos.nil? && @consolas.nil?
          @articulo = Articulo.new(producto_id: @productos.id)
          @productos.update(existencia: @productos.existencia-1)
        end
        respond_to do |format|
            if !@articulo.nil?
              if @articulo.save
                @articulo2= Articulo.all.order('id DESC').first
                @pedido=Pedido.new(cliente_id: params[:cliente_id], total: params[:total], descuento: params[:descuento], cp: params[:cp], calle: params[:calle], numero: params[:numero], sucursal_id: params[:sucursal_id], urgencia: params[:urgencia])
                if @pedido.save
                  @pedido2=Pedido.all.order('id DESC').first
                  @articulospedido=Articulospedido.new(id_compra: @articulo2.id, id_pedido: @pedido2.id)
                  if @articulospedido.save
                    format.html { redirect_to inicio_path, notice: 'Pedido creado.' }
                    format.json { render :show, status: :created, location: @pedido }
                  else
                    @pedido2.destroy
                    @articulo2.destroy
                    format.html { redirect_to inicio_path, notice:'No se pudo crear el pedido, error en el articulo-pedido.' }
                  end
                else
                  @articulo2.destroy
                  format.html { redirect_to inicio_path, notice: 'No se pudo crear el pedido.' }
                end
              else
                format.html { redirect_to inicio_path, notice: 'No se pudo crear el pedido, error en el articulo.' }
                format.json { render json: @articulo.errors, status: :unprocessable_entity }
              end
            else
              format.html { redirect_to inicio_path, notice: 'No se pudo crear el pedido, error en el articulo, es nulo.' }
            end
        end
      end
    else
      respond_to do |format|
          format.html { redirect_to inicio_path, notice: 'Hubo un error, no se encontro el codigo de barras.' }
        end
    end
  end

  def nuevo
    @cliente=Cliente.all
    @sucursal=Sucursal.all
    if params[:codigo_barras].present?
      @productos=Producto.where(codigo_barras: params[:codigo_barras]).first#.find(params[:codigo_barras])#where("nombre LIKE ?", "%" + params[:nombre] + "%")#where('nombre LIKE ?', values).all#where(values)#.where('name LIKE ?', '%egm%').all
      @consolas=Consola.where(codigo_barras: params[:codigo_barras]).first#.find(params[:codigo_barras])#where("nombre LIKE ?", "%" + params[:nombre] + "%")#where('nombre LIKE ?', values).all#where(values)
      @juegos=Juego.where(codigo_barras: params[:codigo_barras]).first#where("titulo LIKE ?", "%" + params[:nombre] + "%")#where('titulo LIKE ?', values).all#where(values)
      if @productos.nil?  && @consolas.nil? && @juegos.nil?
        respond_to do |format|
          format.html { redirect_to inicio_path, notice: 'No se encontro el codigo de barras.' }
        end
      end
    end
    
  end


  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    @cliente =Cliente.all
    @sucursal = Sucursal.all
  end

  # GET /pedidos/1/edit
  def edit
    @cliente =Cliente.all
    @sucursal = Sucursal.all
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido creado.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { redirect_to @pedido, notice: 'No se pudo crear el pedido.' }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido actualizado.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { redirect_to @pedido, notice: 'No se pudo actualizar pedido.' }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido=Pedido.find(params[:id])
    @articulospedido = Articulospedido.where('id_pedido=?',@pedido.id).first
    respond_to do |format|
      if !@articulospedido.nil?
        @articulo=Articulo.find(@articulospedido.id_compra)
        @productos=Producto.where(id: @articulo.producto_id).first
        @consolas=Consola.where(id: @articulo.consola_id).first
        @juegos=Juego.where(id: @articulo.juego_id).first
        if @productos.nil? && @consolas.nil?
          #juego
          @juegos.update(existencia: @juegos.existencia+1)
        elsif  @consolas.nil? && @juegos.nil?
          #producto
          @productos.update(existencia: @productos.existencia+1)
        elsif @juegos.nil? && @productos.nil?
          #consola
          @consolas.update(existencia: @consolas.existencia+1)
        end

          if !@articulo.nil?
            if @articulospedido.destroy
              if @articulo.destroy
                if @pedido.destroy
                  format.html { redirect_to pedidos_path, notice: 'Pedido eliminado.' }
                else
                  format.html { redirect_to pedidos_path, notice: 'Error al eliminar pedido.'  }
                end
              else
                format.html { redirect_to pedidos_path, notice: 'Error al eliminar pedido, no se pudo eliminar relacion articulo-pedido.'  }
              end
            else
              format.html { redirect_to pedidos_path, notice: 'Error al eliminar pedido, no se pudo eliminar relacion articulo-producto.'  }
            end
          else
            format.html { redirect_to pedidos_path, notice: 'Error al encontrar el articulo en articulos-producto.'  }
          end          
      else
          format.html { redirect_to pedidos_path, notice: 'Error al encontrar el pedido en articulos-pedido.'  }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:cliente_id, :total, :descuento, :cp, :calle, :numero, :sucursal_id, :urgencia)
    end
end
