class CreateCasaproductoras < ActiveRecord::Migration[5.2]
  def change
    create_table :casaproductoras do |t|
      t.string :nombre
      t.string :fundador
      t.string :ceo
      t.string :sitio
      t.string :telefono
      t.string :atencion_clientes
      t.string :sede
      t.string :twitter

      t.timestamps
    end
  end
end
