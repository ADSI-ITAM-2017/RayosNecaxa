class CreateArrendatarios < ActiveRecord::Migration[5.0]
  def change
    create_table :arrendatarios do |t|
      t.integer :numRentas
      t.string :universidad
      t.references :usuario, foreign_key: true
      t.timestamps
    end
  end
end
