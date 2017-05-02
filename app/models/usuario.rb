class Usuario < ApplicationRecord
  has_many :arrendadors
  has_many :arrendatarios
end
