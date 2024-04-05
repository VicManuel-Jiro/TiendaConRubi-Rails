class Juego < ApplicationRecord
	belongs_to :consola, optional: true
	belongs_to :casaproductora, optional: true
	belongs_to :plataforma, optional: true
	has_many :articulo
end
