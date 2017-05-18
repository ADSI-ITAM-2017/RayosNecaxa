class AddFieldnameToMensajes < ActiveRecord::Migration[5.0]
  def change
    add_column :mensajes, :id_arrendador, :integer
  end
end
