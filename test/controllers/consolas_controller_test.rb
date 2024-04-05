require 'test_helper'

class ConsolasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consola = consolas(:one)
  end

  test "should get index" do
    get consolas_url
    assert_response :success
  end

  test "should get new" do
    get new_consola_url
    assert_response :success
  end

  test "should create consola" do
    assert_difference('Consola.count') do
      post consolas_url, params: { consola: { capacidad: @consola.capacidad, codigo_barras: @consola.codigo_barras, color: @consola.color, descuento: @consola.descuento, edicion: @consola.edicion, existencia: @consola.existencia, nombre: @consola.nombre, plataforma_id: @consola.plataforma_id, precio: @consola.precio } }
    end

    assert_redirected_to consola_url(Consola.last)
  end

  test "should show consola" do
    get consola_url(@consola)
    assert_response :success
  end

  test "should get edit" do
    get edit_consola_url(@consola)
    assert_response :success
  end

  test "should update consola" do
    patch consola_url(@consola), params: { consola: { capacidad: @consola.capacidad, codigo_barras: @consola.codigo_barras, color: @consola.color, descuento: @consola.descuento, edicion: @consola.edicion, existencia: @consola.existencia, nombre: @consola.nombre, plataforma_id: @consola.plataforma_id, precio: @consola.precio } }
    assert_redirected_to consola_url(@consola)
  end

  test "should destroy consola" do
    assert_difference('Consola.count', -1) do
      delete consola_url(@consola)
    end

    assert_redirected_to consolas_url
  end
end
