require 'test_helper'

class JuegosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @juego = juegos(:one)
  end

  test "should get index" do
    get juegos_url
    assert_response :success
  end

  test "should get new" do
    get new_juego_url
    assert_response :success
  end

  test "should create juego" do
    assert_difference('Juego.count') do
      post juegos_url, params: { juego: { casa_productora_id: @juego.casa_productora_id, clasificacion: @juego.clasificacion, codigo_barras: @juego.codigo_barras, consola_id: @juego.consola_id, descuento: @juego.descuento, edicion: @juego.edicion, existencia: @juego.existencia, genero: @juego.genero, plataforma_id: @juego.plataforma_id, precio: @juego.precio, titulo: @juego.titulo } }
    end

    assert_redirected_to juego_url(Juego.last)
  end

  test "should show juego" do
    get juego_url(@juego)
    assert_response :success
  end

  test "should get edit" do
    get edit_juego_url(@juego)
    assert_response :success
  end

  test "should update juego" do
    patch juego_url(@juego), params: { juego: { casa_productora_id: @juego.casa_productora_id, clasificacion: @juego.clasificacion, codigo_barras: @juego.codigo_barras, consola_id: @juego.consola_id, descuento: @juego.descuento, edicion: @juego.edicion, existencia: @juego.existencia, genero: @juego.genero, plataforma_id: @juego.plataforma_id, precio: @juego.precio, titulo: @juego.titulo } }
    assert_redirected_to juego_url(@juego)
  end

  test "should destroy juego" do
    assert_difference('Juego.count', -1) do
      delete juego_url(@juego)
    end

    assert_redirected_to juegos_url
  end
end
