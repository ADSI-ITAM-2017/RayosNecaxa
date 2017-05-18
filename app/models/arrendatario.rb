class Arrendatario < ApplicationRecord
  belongs_to :usuario
  has_many :likes
  has_many :reservation
  has_many :mensaje
end
