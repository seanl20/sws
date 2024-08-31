class CreateCompanyPriceClose < ActiveRecord::Migration[7.2]
  def change
    create_table :company_price_closes do |t|
      t.date :date
      t.string :company_id
      t.float :price
      t.datetime :date_created
    end
  end
end
