require "application_system_test_case"

class CasaproductorasTest < ApplicationSystemTestCase
  setup do
    @casaproductora = casaproductoras(:one)
  end

  test "visiting the index" do
    visit casaproductoras_url
    assert_selector "h1", text: "Casaproductoras"
  end

  test "creating a Casaproductora" do
    visit casaproductoras_url
    click_on "New Casaproductora"

    fill_in "Atencion clientes", with: @casaproductora.atencion_clientes
    fill_in "Ceo", with: @casaproductora.ceo
    fill_in "Fundador", with: @casaproductora.fundador
    fill_in "Nombre", with: @casaproductora.nombre
    fill_in "Sede", with: @casaproductora.sede
    fill_in "Sitio", with: @casaproductora.sitio
    fill_in "Telefono", with: @casaproductora.telefono
    fill_in "Twitter", with: @casaproductora.twitter
    click_on "Create Casaproductora"

    assert_text "Casaproductora was successfully created"
    click_on "Back"
  end

  test "updating a Casaproductora" do
    visit casaproductoras_url
    click_on "Edit", match: :first

    fill_in "Atencion clientes", with: @casaproductora.atencion_clientes
    fill_in "Ceo", with: @casaproductora.ceo
    fill_in "Fundador", with: @casaproductora.fundador
    fill_in "Nombre", with: @casaproductora.nombre
    fill_in "Sede", with: @casaproductora.sede
    fill_in "Sitio", with: @casaproductora.sitio
    fill_in "Telefono", with: @casaproductora.telefono
    fill_in "Twitter", with: @casaproductora.twitter
    click_on "Update Casaproductora"

    assert_text "Casaproductora was successfully updated"
    click_on "Back"
  end

  test "destroying a Casaproductora" do
    visit casaproductoras_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Casaproductora was successfully destroyed"
  end
end
