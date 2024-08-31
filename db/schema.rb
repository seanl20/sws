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

ActiveRecord::Schema[7.2].define(version: 2024_08_31_000647) do
  create_table "companies", id: :string, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name"
    t.string "ticker_symbol"
    t.string "exchange_symbol"
    t.string "unique_symbol"
    t.datetime "date_generated"
    t.string "security_name"
    t.string "exchange_country_iso"
    t.string "listing_currency_iso"
    t.string "canonical_url"
    t.string "unique_symbol_slug"
    t.integer "score_id"
  end

  create_table "company_price_closes", force: :cascade do |t|
    t.date "date"
    t.string "company_id"
    t.float "price"
    t.datetime "date_created"
  end

  create_table "company_scores", force: :cascade do |t|
    t.string "company_id"
    t.datetime "date_generated"
    t.integer "dividend"
    t.integer "future"
    t.integer "health"
    t.integer "management"
    t.integer "past"
    t.integer "value"
    t.integer "misc"
    t.integer "total"
    t.string "sentence"
  end
end
