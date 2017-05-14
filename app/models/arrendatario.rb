class Arrendatario < ApplicationRecord
  belongs_to :usuario
  has_many :likes
end
