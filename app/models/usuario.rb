class Usuario < ApplicationRecord
	belongs_to :estado, optional: true
end
