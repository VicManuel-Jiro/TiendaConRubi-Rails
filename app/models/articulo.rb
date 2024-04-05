class Articulo < ApplicationRecord
	belongs_to :juego, optional: true
	belongs_to :consola, optional: true
	belongs_to :producto, optional: true
	has_many :articulospedido
end
