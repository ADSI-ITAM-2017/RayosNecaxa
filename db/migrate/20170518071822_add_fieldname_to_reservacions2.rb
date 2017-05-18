class AddFieldnameToReservacions2 < ActiveRecord::Migration[5.0]
  def change
    add_column :reservacions, :id_arrendatario, :integer
  end
end
