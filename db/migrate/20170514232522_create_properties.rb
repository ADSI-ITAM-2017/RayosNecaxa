class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.string :dir
      t.integer :price
      t.references :arrendador, foreign_key: true

      t.timestamps
    end
  end
end
