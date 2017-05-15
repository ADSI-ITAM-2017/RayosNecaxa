class Like < ApplicationRecord
  belongs_to :property
  belongs_to :arrendatario

  validates_uniqueness_of :propiedad_id, :scope => [:arrendatario_id]
end
