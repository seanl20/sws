# frozen_string_literal: true

module Repositories
  class CompanyPriceCloseRepo
    def batch_create(batch_attrs)
      ActiveRecord::Base.transaction do
        batch_attrs.map do |attrs|
          company = Company.find(attrs["company_id"])

          CompanyPriceClose.create!(
            company:,
            date: attrs["date"],
            price: attrs["price"],
            date_created: attrs["date_created"]
          )
        end
      end
    end
  end
end
