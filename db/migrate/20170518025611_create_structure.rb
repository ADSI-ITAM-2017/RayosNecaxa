class CreateStructure < ActiveRecord::Migration[5.0]
  def change
   		create_table "arrendadors", force: :cascade do |t|
    t.integer  "numprop"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_arrendadors_on_usuario_id"
  end

  create_table "arrendatarios", force: :cascade do |t|
    t.integer  "numrentas"
    t.string   "universidad"
    t.integer  "usuario_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["usuario_id"], name: "index_arrendatarios_on_usuario_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "propiedad_id"
    t.integer  "arrendatario_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["arrendatario_id"], name: "index_likes_on_arrendatario_id"
    t.index ["propiedad_id"], name: "index_likes_on_propiedad_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "dir"
    t.integer  "price"
    t.integer  "arrendador_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["arrendador_id"], name: "index_properties_on_arrendador_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "rol"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end 
   
  end
end
