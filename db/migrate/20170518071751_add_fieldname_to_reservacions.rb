class AddFieldnameToReservacions < ActiveRecord::Migration[5.0]
  def change
    add_column :reservacions, :id_arrendador, :integer
  end
end
