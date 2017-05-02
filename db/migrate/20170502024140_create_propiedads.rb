class CreatePropiedads < ActiveRecord::Migration[5.0]
  def change
    create_table :propiedads do |t|
      t.decimal :precio
      t.string :nombre
      t.string :direccion
      t.string :imagen
      t.references :arrendador, foreign_key: true
      t.timestamps
    end
  end
end
