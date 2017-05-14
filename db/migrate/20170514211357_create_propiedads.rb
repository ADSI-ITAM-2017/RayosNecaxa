class CreatePropiedads < ActiveRecord::Migration[5.0]
  def change
    create_table :propiedads do |t|
      t.string :nombre
      t.string :direccion
      t.integer :precio
      t.references :arrendador, foreign_key: true

      t.timestamps
    end
  end
end
