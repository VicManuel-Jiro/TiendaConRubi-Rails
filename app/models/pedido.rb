class Pedido < ApplicationRecord
	belongs_to :sucursal, optional: true
	belongs_to :cliente, optional: true
end
