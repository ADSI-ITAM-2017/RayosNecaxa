class CreateReservacions < ActiveRecord::Migration[5.0]
  def change
    create_table :reservacions do |t|
      t.date "fechaIni"
      t.date "fechaFin"
      t.timestamps
    end
  end
end
