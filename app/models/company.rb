class Company < ApplicationRecord
  has_one :company_score, foreign_key: "company_id"
  has_many :company_price_closes, foreign_key: "company_id"

  before_validation :set_id, on: :create

  # set UUID as the sqlite3 for ruby on rails does not have UUID compability.
  def set_id
    self.id ||= SecureRandom.uuid
  end
end
