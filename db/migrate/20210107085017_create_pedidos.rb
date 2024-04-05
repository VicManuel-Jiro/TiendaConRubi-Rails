class CreatePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.int :cliente_id
      t.decimal :total
      t.int :descuento
      t.int :cp
      t.string :calle
      t.int :numero
      t.int :sucursal_id
      t.string :urgencia

      t.timestamps
    end
  end
end
