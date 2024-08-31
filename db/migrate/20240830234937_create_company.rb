class CreateCompany < ActiveRecord::Migration[7.2]
  def change
    create_table :companies, id: false do |t|
      t.primary_key :id, :string, default: -> { "uuid_generate_v4()" }
      t.string :name
      t.string :ticker_symbol
      t.string :exchange_symbol
      t.string :unique_symbol
      t.datetime :date_generated
      t.string :security_name
      t.string :exchange_country_iso
      t.string :listing_currency_iso
      t.string :canonical_url
      t.string :unique_symbol_slug
      t.references :company_score, null: false, foreign_key: true
    end
  end
end
