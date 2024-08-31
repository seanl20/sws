class Company < ApplicationRecord
  has_one :company_score
  has_one :company_price_closes
end