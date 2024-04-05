json.extract! pedido, :id, :cliente_id, :total, :descuento, :cp, :calle, :numero, :sucursal_id, :urgencia, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
