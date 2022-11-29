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

ActiveRecord::Schema[7.0].define(version: 2022_11_24_183757) do
  create_table "brands", charset: "utf8mb4", force: :cascade do |t|
    t.string "brand_name"
    t.bigint "supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_brands_on_supplier_id"
  end

  create_table "employees", charset: "utf8mb4", force: :cascade do |t|
    t.string "empl_code"
    t.string "empl_name"
    t.string "empl_surname"
    t.string "empl_email"
    t.string "empl_password"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_employees_on_shop_id"
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.string "product_ref"
    t.string "product_size"
    t.string "product_color_code"
    t.string "product_color_descr"
    t.string "product_gender"
    t.string "product_style"
    t.string "product_type"
    t.string "product_material"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "shops", charset: "utf8mb4", force: :cascade do |t|
    t.string "shop_code"
    t.string "shop_name"
    t.float "shop_lat"
    t.float "shop_long"
    t.integer "shop_cp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "shop_id"
    t.integer "available"
    t.integer "booked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_stocks_on_product_id"
    t.index ["shop_id"], name: "index_stocks_on_shop_id"
  end

  create_table "suppliers", charset: "utf8mb4", force: :cascade do |t|
    t.string "supp_name"
    t.float "supp_coeff"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
