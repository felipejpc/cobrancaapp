# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_05_210203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cidades", force: :cascade do |t|
    t.string "nome", null: false
    t.string "uf", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nome"], name: "index_cidades_on_nome"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome", null: false
    t.string "endereco"
    t.string "cliente_index", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cidade_id", null: false
    t.string "fone_fixo"
    t.string "fone_celular"
    t.index ["cidade_id"], name: "index_clientes_on_cidade_id"
    t.index ["cliente_index"], name: "index_clientes_on_cliente_index", unique: true
    t.index ["nome"], name: "index_clientes_on_nome"
  end

  create_table "pagamentos", force: :cascade do |t|
    t.integer "parcela"
    t.date "dt_venc"
    t.decimal "valor", precision: 8, scale: 2
    t.date "dt_pgto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "venda_id", null: false
    t.index ["dt_pgto"], name: "index_pagamentos_on_dt_pgto"
    t.index ["dt_venc"], name: "index_pagamentos_on_dt_venc"
    t.index ["venda_id"], name: "index_pagamentos_on_venda_id"
  end

  create_table "vendas", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.text "mercadorias"
    t.decimal "valor", precision: 8, scale: 2
    t.date "data"
    t.string "obs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_vendas_on_cliente_id"
    t.index ["data"], name: "index_vendas_on_data"
  end

  add_foreign_key "clientes", "cidades"
  add_foreign_key "pagamentos", "vendas"
  add_foreign_key "vendas", "clientes"
end
