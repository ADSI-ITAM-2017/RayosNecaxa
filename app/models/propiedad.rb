class Propiedad < ApplicationRecord
  belongs_to :arrendador
  has_many :like
end
