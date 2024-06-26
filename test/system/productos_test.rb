require "application_system_test_case"

class ProductosTest < ApplicationSystemTestCase
  setup do
    @producto = productos(:one)
  end

  test "visiting the index" do
    visit productos_url
    assert_selector "h1", text: "Productos"
  end

  test "creating a Producto" do
    visit productos_url
    click_on "New Producto"

    fill_in "Categoria", with: @producto.categoria
    fill_in "Codigo barras", with: @producto.codigo_barras
    fill_in "Color", with: @producto.color
    fill_in "Descripcion", with: @producto.descripcion
    fill_in "Descuento", with: @producto.descuento
    fill_in "Existencia", with: @producto.existencia
    fill_in "Nombre", with: @producto.nombre
    fill_in "Precio", with: @producto.precio
    fill_in "Proveedor", with: @producto.proveedor_id
    click_on "Create Producto"

    assert_text "Producto was successfully created"
    click_on "Back"
  end

  test "updating a Producto" do
    visit productos_url
    click_on "Edit", match: :first

    fill_in "Categoria", with: @producto.categoria
    fill_in "Codigo barras", with: @producto.codigo_barras
    fill_in "Color", with: @producto.color
    fill_in "Descripcion", with: @producto.descripcion
    fill_in "Descuento", with: @producto.descuento
    fill_in "Existencia", with: @producto.existencia
    fill_in "Nombre", with: @producto.nombre
    fill_in "Precio", with: @producto.precio
    fill_in "Proveedor", with: @producto.proveedor_id
    click_on "Update Producto"

    assert_text "Producto was successfully updated"
    click_on "Back"
  end

  test "destroying a Producto" do
    visit productos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Producto was successfully destroyed"
  end
end
