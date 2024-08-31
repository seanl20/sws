class Company < ApplicationRecord
  has_one :company_score, foreign_key: 'company_id'
  has_one :company_price_closes, foreign_key: 'company_id'
end