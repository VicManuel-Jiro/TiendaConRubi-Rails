class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :categoria
      t.string :color
      t.int :existencia
      t.decimal :precio
      t.int :descuento
      t.string :codigo_barras
      t.int :proveedor_id

      t.timestamps
    end
  end
end
