class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.date :fechares
      t.references :propiedad, foreign_key: true
      t.references :arrendatario, foreign_key: true

      t.timestamps
    end
  end
end
