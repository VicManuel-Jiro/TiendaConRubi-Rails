class CreateConsolas < ActiveRecord::Migration[5.2]
  def change
    create_table :consolas do |t|
      t.string :nombre
      t.int :plataforma_id
      t.string :color
      t.string :edicion
      t.int :capacidad
      t.int :existencia
      t.decimal :precio
      t.int :descuento
      t.string :codigo_barras

      t.timestamps
    end
  end
end
