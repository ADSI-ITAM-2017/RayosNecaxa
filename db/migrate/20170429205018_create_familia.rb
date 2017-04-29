class CreateFamilia < ActiveRecord::Migration[5.0]
  def change
    create_table :familia do |t|

      t.timestamps
    end
  end
end
