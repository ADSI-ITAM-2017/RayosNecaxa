class Arrendador < ApplicationRecord
  belongs_to :usuario
  has_many :property
end
