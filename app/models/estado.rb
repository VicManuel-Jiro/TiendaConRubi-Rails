class Estado < ApplicationRecord
	belongs_to :pais, optional: true
	has_many :usuario
end
