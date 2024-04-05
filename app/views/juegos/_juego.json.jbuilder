json.extract! juego, :id, :titulo, :plataforma_id, :consola_id, :edicion, :genero, :clasificacion, :casa_productora_id, :existencia, :precio, :descuento, :codigo_barras, :created_at, :updated_at
json.url juego_url(juego, format: :json)
