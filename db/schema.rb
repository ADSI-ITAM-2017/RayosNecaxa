# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170502024150) do

  create_table "arrendadors", force: :cascade do |t|
    t.integer  "numProp"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_arrendadors_on_usuario_id"
  end

  create_table "arrendatarios", force: :cascade do |t|
    t.integer  "numRentas"
    t.string   "universidad"
    t.integer  "usuario_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["usuario_id"], name: "index_arrendatarios_on_usuario_id"
  end

  create_table "familia", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "propiedads", force: :cascade do |t|
    t.decimal  "precio"
    t.string   "nombre"
    t.string   "direccion"
    t.string   "imagen"
    t.integer  "arrendador_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["arrendador_id"], name: "index_propiedads_on_arrendador_id"
  end

  create_table "reservacions", force: :cascade do |t|
    t.string   "fechaini"
    t.string   "fechafin"
    t.integer  "arrendatario_id"
    t.integer  "propiedad_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["arrendatario_id"], name: "index_reservacions_on_arrendatario_id"
    t.index ["propiedad_id"], name: "index_reservacions_on_propiedad_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "imagen"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "mail"
    t.string   "fecNac"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
