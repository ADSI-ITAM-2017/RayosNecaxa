class Property < ApplicationRecord
  belongs_to :arrendador
  validates :title, presence:true,length:{minimum:5}
	validates :description, presence:true,length:{minimum:5}	
	has_attached_file :image, :styles => {
      :thumb => "100x100#",
      :small  => "150x150#",
      :medium => "200x200#" }, default_url: "/images/:style/missing.png"
	
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/	
end
