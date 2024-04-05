class CreateJuegos < ActiveRecord::Migration[5.2]
  def change
    create_table :juegos do |t|
      t.string :titulo
      t.int :plataforma_id
      t.int :consola_id
      t.string :edicion
      t.string :genero
      t.string :clasificacion
      t.int :casa_productora_id
      t.int :existencia
      t.decimal :precio
      t.int :descuento
      t.string :codigo_barras

      t.timestamps
    end
  end
end
