class Reservacion < ApplicationRecord
  #belongs_to :arrendatario
  #belongs_to :propiedad
  has_one :propiedad
  has_one :arrendatario
  validates_presence_of :arrendatario_id, message: 'El arrendatario es requerido.'
  validates_presence_of :propiedad_id, message: 'La propiedad es requerida.'
end
