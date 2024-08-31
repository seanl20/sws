class CreateCompanyPriceClose < ActiveRecord::Migration[7.2]
  def change
    create_table :company_price_closes do |t|
      t.date :date
      t.references :company, null: false, foreign_key: true
      t.float :price
      t.datetime :date_created
    end
  end
end
