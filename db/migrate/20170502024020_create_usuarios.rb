class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :imagen
      t.string :nombre
      t.string :apellido
      t.string :mail
      t.string :fecNac
      t.timestamps
    end
  end
end
