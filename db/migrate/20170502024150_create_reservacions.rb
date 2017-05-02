class CreateReservacions < ActiveRecord::Migration[5.0]
  def change
    create_table :reservacions do |t|
      t.string :fechaini
      t.string :fechafin
      t.references :arrendatario, foreign_key: true
      t.references :propiedad, foreign_key: true
      t.timestamps
    end
  end
end
