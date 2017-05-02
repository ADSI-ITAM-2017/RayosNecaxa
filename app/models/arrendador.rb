class Arrendador < ApplicationRecord
  belongs_to :usuario
  has_many :propiedads
  validates_presence_of :usuario_id, message: 'El usuario es requerido.'
end
