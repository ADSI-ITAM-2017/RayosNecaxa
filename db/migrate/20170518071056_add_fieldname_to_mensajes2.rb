class AddFieldnameToMensajes2 < ActiveRecord::Migration[5.0]
  def change
    add_column :mensajes, :id_arrendatario, :integer
  end
end
