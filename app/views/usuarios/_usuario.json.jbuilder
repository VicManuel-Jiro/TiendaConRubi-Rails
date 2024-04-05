json.extract! usuario, :id, :rfc, :curp, :nombre, :paterno, :materno, :sexo, :telefono, :correo, :login, :password, :estado_id, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
