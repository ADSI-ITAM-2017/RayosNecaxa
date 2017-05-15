class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :registraRolUsuario

  def registraRolUsuario
  	 if(self.rol == 'Arrendador')
  	 	a1 = Arrendador.new({usuario_id: self.id,numprop: 0})
  	 	a1.save()
  	 elsif (self.rol == 'Arrendatario')
  	 	a1 = Arrendatario.new({usuario_id: self.id,numrentas: 0,universidad: 'ITAM'})
  	 	a1.save()
  	 end
  end
end
