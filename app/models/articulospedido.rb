class Articulospedido < ApplicationRecord
	belongs_to :articulo, optional: true
end
