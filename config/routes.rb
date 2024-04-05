Rails.application.routes.draw do
  resources :casaproductoras
  resources :juegos
  resources :pedidos
  resources :productos
  resources :consolas
  #get 'sesiones/login'
  resources :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '/estados'=> 'estados#inicio', via: :get, :as => :estados_inicio
  match '/estado/:id/mostrar' => 'estados#mostrar_estados', via: :get, :as => :mostrar_estado
  match '/estado/nuevo' => 'estados#nuevo', via: :get, :as => :nuevo_estado
  match '/estado/crear' => 'estados#crear', via: :post, :as => :crear_estado
  match '/estado/:id/editar' => 'estados#editar', via: :get, :as => :editar_estado
  match '/estado/actualizar' => 'estados#actualizar', via: :patch, :as => :actualizar_estado
  match '/estado/:id/eliminar' => 'estados#eliminar', via: :delete, :as => :eliminar_estado
  match '/paises'=> 'paises#inicio', via: :get, :as => :paises_inicio
  match '/pais/:id/mostrar' => 'paises#mostrar_paises', via: :get, :as => :mostrar_pais
  match '/pais/nuevo' => 'paises#nuevo', via: :get, :as => :nuevo_pais
  match '/pais/crear' => 'paises#crear', via: :post, :as => :crear_pais
  match '/pais/:id/editar' => 'paises#editar', via: :get, :as => :editar_pais
  match '/pais/actualizar' => 'paises#actualizar', via: :patch, :as => :actualizar_pais
  match '/pais/:id/eliminar' => 'paises#eliminar', via: :delete, :as => :eliminar_pais
  match '/buscar_usuario' => 'usuarios#index', via: :post, :as => :buscar_usuario
  match '/validar_rfc' => 'usuarios#validar_rfc', via: :get, :as => :validar_rfc_usuario
  match '/validar_curp' => 'usuarios#validar_curp', via: :get, :as => :validar_curp_usuario
  match '/validar_login' => 'usuarios#validar_login', via: :get, :as => :validar_login_usuario
  match '/login' => 'sesiones#login', via: :get, :as => :login
  match '/login' => 'sesiones#validar', via: :post, :as => :login_post
  match '/cerrar_sesion' => 'sesiones#cerrar_sesion', via: :get, :as => :cerrar_sesion
  #------------------------------------------------------------------------------------------------------------------
  #proveedores
  match '/proveedores'=> 'proveedores#inicio', via: :get, :as => :proveedores_inicio
  match '/proveedor/:id/mostrar' => 'proveedores#mostrar_proveedores', via: :get, :as => :mostrar_proveedor
  match '/proveedor/nuevo' => 'proveedores#nuevo', via: :get, :as => :nuevo_proveedor
  match '/proveedor/crear' => 'proveedores#crear', via: :post, :as => :crear_proveedor
  match '/proveedor/:id/editar' => 'proveedores#editar', via: :get, :as => :editar_proveedor
  match '/proveedor/actualizar' => 'proveedores#actualizar', via: :patch, :as => :actualizar_proveedor
  match '/proveedor/:id/eliminar' => 'proveedores#eliminar', via: :delete, :as => :eliminar_proveedor
  match '/validar_rfc_proveedor' => 'proveedores#validar_rfc', via: :get, :as => :validar_rfc_proveedores
  #------------------------------------------------------------------------------------------------------------------
  #plataformas
  match '/plataformas'=> 'plataformas#inicio', via: :get, :as => :plataformas_inicio
  match '/plataforma/:id/mostrar' => 'plataformas#mostrar_plataformas', via: :get, :as => :mostrar_plataforma
  match '/plataforma/nuevo' => 'plataformas#nuevo', via: :get, :as => :nuevo_plataforma
  match '/plataforma/crear' => 'plataformas#crear', via: :post, :as => :crear_plataforma
  match '/plataforma/:id/editar' => 'plataformas#editar', via: :get, :as => :editar_plataforma
  match '/plataforma/actualizar' => 'plataformas#actualizar', via: :patch, :as => :actualizar_plataforma
  match '/plataforma/:id/eliminar' => 'plataformas#eliminar', via: :delete, :as => :eliminar_plataforma 
  match '/validar_nombre_plataforma' => 'plataformas#validar_plataforma', via: :get, :as => :validar_nombre_plataformas
  #------------------------------------------------------------------------------------------------------------------
  #sucursales
  match '/sucursales'=> 'sucursales#inicio', via: :get, :as => :sucursales_inicio
  match '/sucursal/:id/mostrar' => 'sucursales#mostrar_sucursales', via: :get, :as => :mostrar_sucursal
  match '/sucursal/nuevo' => 'sucursales#nuevo', via: :get, :as => :nuevo_sucursal
  match '/sucursal/crear' => 'sucursales#crear', via: :post, :as => :crear_sucursal
  match '/sucursal/:id/editar' => 'sucursales#editar', via: :get, :as => :editar_sucursal
  match '/sucursal/actualizar' => 'sucursales#actualizar', via: :patch, :as => :actualizar_sucursal
  match '/sucursal/:id/eliminar' => 'sucursales#eliminar', via: :delete, :as => :eliminar_sucursal
  match '/validar_no_sucursal' => 'sucursales#validar_sucursal', via: :get, :as => :validar_no_sucursales
  #------------------------------------------------------------------------------------------------------------------
  #clientes
  match '/clientes'=> 'clientes#inicio', via: :get, :as => :clientes_inicio
  match '/cliente/:id/mostrar' => 'clientes#mostrar_clientes', via: :get, :as => :mostrar_cliente
  match '/cliente/nuevo' => 'clientes#nuevo', via: :get, :as => :nuevo_cliente
  match '/cliente/crear' => 'clientes#crear', via: :post, :as => :crear_cliente
  match '/cliente/:id/editar' => 'clientes#editar', via: :get, :as => :editar_cliente
  match '/cliente/actualizar' => 'clientes#actualizar', via: :patch, :as => :actualizar_cliente
  match '/cliente/:id/eliminar' => 'clientes#eliminar', via: :delete, :as => :eliminar_cliente
  match '/validar_rfc_cliente' => 'clientes#validar_codigo', via: :get, :as => :validar_rfc_clientes
  #------------------------------------------------------------------------------------------------------------------
  #juegos
  match '/validar_codigo' => 'juegos#validar_codigo', via: :get, :as => :validar_codigo_juego
  #------------------------------------------------------------------------------------------------------------------
  #consolas
  match '/validar_codigo_consola' => 'consolas#validar_codigo', via: :get, :as => :validar_codigo_consolas
  #------------------------------------------------------------------------------------------------------------------
  #productos
  match '/validar_codigo_producto' => 'productos#validar_codigo', via: :get, :as => :validar_codigo_productos
  #------------------------------------------------------------------------------------------------------------------
  #inicio
  match '/inicio' => 'principales#inicio', via: :get, :as => :inicio
  #------------------------------------------------------------------------------------------------------------------
  #pedidos
  match '/buscar_producto' => 'principales#inicio', via: :post, :as => :buscar_producto
  match '/nuevo_pedido/:codigo_barras' => 'pedidos#nuevo', via: :get, :as => :nuevo_pedido
  match '/crear_pedido/:codigo_barras'=> 'pedidos#crear', via: :post, :as => :crear_pedido
end
