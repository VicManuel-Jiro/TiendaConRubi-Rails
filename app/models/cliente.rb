class Cliente < ApplicationRecord
	has_many :pedido
	belongs_to :estado, optional: true
end
