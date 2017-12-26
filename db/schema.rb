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

ActiveRecord::Schema.define(version: 20171226125212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "agency_id"
    t.string   "conta"
    t.decimal  "limite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "balance"
    t.index ["agency_id"], name: "index_accounts_on_agency_id", using: :btree
  end

  create_table "agencia", force: :cascade do |t|
    t.integer  "numero"
    t.string   "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agencies", force: :cascade do |t|
    t.integer  "numero"
    t.string   "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conta", force: :cascade do |t|
    t.integer  "agencia_id"
    t.string   "conta"
    t.decimal  "limite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agencia_id"], name: "index_conta_on_agencia_id", using: :btree
  end

  create_table "transacaos", force: :cascade do |t|
    t.integer  "conta_id"
    t.decimal  "valor"
    t.string   "tipo"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conta_id"], name: "index_transacaos_on_conta_id", using: :btree
    t.index ["usuario_id"], name: "index_transacaos_on_usuario_id", using: :btree
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "accounts_id"
    t.decimal  "valor"
    t.string   "tipo"
    t.integer  "usuario_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["accounts_id"], name: "index_transactions_on_accounts_id", using: :btree
    t.index ["usuario_id"], name: "index_transactions_on_usuario_id", using: :btree
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "accounts", "agencies"
  add_foreign_key "conta", "agencia", column: "agencia_id"
  add_foreign_key "transacaos", "conta", column: "conta_id"
  add_foreign_key "transacaos", "usuarios"
  add_foreign_key "transactions", "accounts", column: "accounts_id"
  add_foreign_key "transactions", "usuarios"
end
