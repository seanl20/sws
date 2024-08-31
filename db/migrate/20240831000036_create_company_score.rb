class CreateCompanyScore < ActiveRecord::Migration[7.2]
  def change
    create_table :company_scores do |t|
      t.string :company_id
      t.datetime :date_generated
      t.integer :dividend
      t.integer :future
      t.integer :health
      t.integer :management
      t.integer :past
      t.integer :value
      t.integer :misc
      t.integer :total
      t.string :sentence
    end
  end
end
