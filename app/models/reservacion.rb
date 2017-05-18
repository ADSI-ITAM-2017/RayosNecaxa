class Reservacion < ApplicationRecord
	belongs_to :arrendador
   	belongs_to :arrendatario
end
