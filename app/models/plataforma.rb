class Plataforma < ApplicationRecord
	has_many :juego
	has_many :consola
end
