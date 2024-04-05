class Producto < ApplicationRecord
	belongs_to :proveedor, optional: true
	has_many :articulo
end
