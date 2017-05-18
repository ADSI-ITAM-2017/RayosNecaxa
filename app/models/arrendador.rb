class Arrendador < ApplicationRecord
  belongs_to :usuario
  has_many :property
  has_many :reservation
  has_many :mensaje
end
