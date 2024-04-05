require 'test_helper'

class CasaproductorasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @casaproductora = casaproductoras(:one)
  end

  test "should get index" do
    get casaproductoras_url
    assert_response :success
  end

  test "should get new" do
    get new_casaproductora_url
    assert_response :success
  end

  test "should create casaproductora" do
    assert_difference('Casaproductora.count') do
      post casaproductoras_url, params: { casaproductora: { atencion_clientes: @casaproductora.atencion_clientes, ceo: @casaproductora.ceo, fundador: @casaproductora.fundador, nombre: @casaproductora.nombre, sede: @casaproductora.sede, sitio: @casaproductora.sitio, telefono: @casaproductora.telefono, twitter: @casaproductora.twitter } }
    end

    assert_redirected_to casaproductora_url(Casaproductora.last)
  end

  test "should show casaproductora" do
    get casaproductora_url(@casaproductora)
    assert_response :success
  end

  test "should get edit" do
    get edit_casaproductora_url(@casaproductora)
    assert_response :success
  end

  test "should update casaproductora" do
    patch casaproductora_url(@casaproductora), params: { casaproductora: { atencion_clientes: @casaproductora.atencion_clientes, ceo: @casaproductora.ceo, fundador: @casaproductora.fundador, nombre: @casaproductora.nombre, sede: @casaproductora.sede, sitio: @casaproductora.sitio, telefono: @casaproductora.telefono, twitter: @casaproductora.twitter } }
    assert_redirected_to casaproductora_url(@casaproductora)
  end

  test "should destroy casaproductora" do
    assert_difference('Casaproductora.count', -1) do
      delete casaproductora_url(@casaproductora)
    end

    assert_redirected_to casaproductoras_url
  end
end
