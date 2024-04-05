class Consola < ApplicationRecord
	belongs_to :plataforma, optional: true
	has_many :juego
	has_many :articulo
end
