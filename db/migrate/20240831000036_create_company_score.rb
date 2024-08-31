class CreateCompanyScore < ActiveRecord::Migration[7.2]
  def change
    create_table :company_scores do |t|
      t.references :company, null: false, foreign_key: true
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
