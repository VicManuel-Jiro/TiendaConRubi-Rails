require "application_system_test_case"

class ConsolasTest < ApplicationSystemTestCase
  setup do
    @consola = consolas(:one)
  end

  test "visiting the index" do
    visit consolas_url
    assert_selector "h1", text: "Consolas"
  end

  test "creating a Consola" do
    visit consolas_url
    click_on "New Consola"

    fill_in "Capacidad", with: @consola.capacidad
    fill_in "Codigo barras", with: @consola.codigo_barras
    fill_in "Color", with: @consola.color
    fill_in "Descuento", with: @consola.descuento
    fill_in "Edicion", with: @consola.edicion
    fill_in "Existencia", with: @consola.existencia
    fill_in "Nombre", with: @consola.nombre
    fill_in "Plataforma", with: @consola.plataforma_id
    fill_in "Precio", with: @consola.precio
    click_on "Create Consola"

    assert_text "Consola was successfully created"
    click_on "Back"
  end

  test "updating a Consola" do
    visit consolas_url
    click_on "Edit", match: :first

    fill_in "Capacidad", with: @consola.capacidad
    fill_in "Codigo barras", with: @consola.codigo_barras
    fill_in "Color", with: @consola.color
    fill_in "Descuento", with: @consola.descuento
    fill_in "Edicion", with: @consola.edicion
    fill_in "Existencia", with: @consola.existencia
    fill_in "Nombre", with: @consola.nombre
    fill_in "Plataforma", with: @consola.plataforma_id
    fill_in "Precio", with: @consola.precio
    click_on "Update Consola"

    assert_text "Consola was successfully updated"
    click_on "Back"
  end

  test "destroying a Consola" do
    visit consolas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Consola was successfully destroyed"
  end
end
