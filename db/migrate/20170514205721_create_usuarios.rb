class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.string :rol
      t.string :mail
      t.string :password

      t.timestamps
    end
  end
end
