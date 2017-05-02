class Arrendatario < ApplicationRecord
  belongs_to :usuario

  validates_presence_of :usuario_id, message: 'El usuario es requerido.'
end
