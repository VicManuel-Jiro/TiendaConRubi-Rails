json.extract! producto, :id, :nombre, :descripcion, :categoria, :color, :existencia, :precio, :descuento, :codigo_barras, :proveedor_id, :created_at, :updated_at
json.url producto_url(producto, format: :json)
