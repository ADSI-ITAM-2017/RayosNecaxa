class Propiedad < ApplicationRecord
  belongs_to :arrendador
  has_one :arrendador
  validates_presence_of :arrendador_id, message: 'El arrendador es requerido.'
end
