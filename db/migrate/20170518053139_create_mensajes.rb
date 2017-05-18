class CreateMensajes < ActiveRecord::Migration[5.0]
  def change
    create_table :mensajes do |t|
      t.datetime 'horaEnvio'
      t.string 'titulo'
      t.text 'mensaje'
      t.timestamps
    end
  end
end
