class Arrendador < ApplicationRecord
  belongs_to :usuario
  has_many :propiedad
end
