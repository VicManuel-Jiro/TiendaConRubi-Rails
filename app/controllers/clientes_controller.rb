class ClientesController < ApplicationController

  # GET /clientes
  # GET /clientes.json
  def inicio
    @clientes = Cliente.all
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def mostrar_clientes
    @cliente=Cliente.find(params[:id])
  end

  # GET /clientes/new
  def nuevo
    @cliente = Cliente.new
    @estado=Estado.all
  end

  # GET /clientes/1/edit
  def editar
    @cliente=Cliente.find(params[:id])
    @estado=Estado.all
  end

  # POST /clientes
  # POST /clientes.json
  def crear
    @cliente = Cliente.new(nombre: params[:cliente][:nombre], paterno: params[:cliente][:paterno], materno: params[:cliente][:materno], telefono: params[:cliente][:telefono], correo: params[:cliente][:correo], estado_id: params[:cliente][:estado_id], cp: params[:cliente][:cp], calle: params[:cliente][:calle], numero: params[:cliente][:numero], rfc: params[:cliente][:rfc])
    respond_to do |format|
      if @cliente.save
        format.html { redirect_to clientes_inicio_path, notice: 'Cliente creado.' }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { redirect_to clientes_inicio_path, notice: 'No se pudo crear el cliente.' }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def actualizar
    @cliente=Cliente.find(params[:cliente][:id])
    respond_to do |format|
      if @cliente.update(nombre: params[:cliente][:nombre], paterno: params[:cliente][:paterno], materno: params[:cliente][:materno], telefono: params[:cliente][:telefono], correo: params[:cliente][:correo], estado_id: params[:cliente][:estado_id], cp: params[:cliente][:cp], calle: params[:cliente][:calle], numero: params[:cliente][:numero], rfc: params[:cliente][:rfc])
        format.html { redirect_to clientes_inicio_path, notice: 'Cliente actualizado.' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { redirect_to clientes_inicio_path, notice: 'No se pudo actualizar el cliente.' }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def eliminar
    @cliente=Cliente.find(params[:id])
    @pedido = Pedido.where('cliente_id=?',params[:id]).first
    respond_to do |format|
      if @pedido.nil?
            if @cliente.destroy
              format.html { redirect_to clientes_inicio_path, notice: 'Cliente eliminado.' }
            else
              format.html { redirect_to @clientes_inicio_path, notice: 'No se pudo eliminar el cliente.'  }
            end
      else
          format.html { redirect_to clientes_inicio_path, notice: 'No se pudo eliminar el cliente, hay registros que lo usan.'  }
      end
    end
  end
def validar_codigo
    @cliente = Cliente.where('rfc = ?',params[:cliente][:rfc]).first
    if @cliente.nil?
      validar_cliente = true;
    else
      if (@cliente.id).to_i == (params[:cliente_id]).to_i
        validar_cliente = true;
      else
        validar_cliente = false;
      end
    end
        respond_to do |format|
          format.js{render json: { validar: validar_cliente }, content_type: 'text/json'}
        end
  end
end