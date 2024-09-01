# frozen_string_literal: true

module Repositories
  class CompanyRepo
    def batch_create(batch_attrs)
      ActiveRecord::Base.transaction do
        batch_attrs.map do |attrs|
          Company.create!(Changesets::CompanyCsvImport.map(attrs))
        end
      end
    end

    def get_all
      Company
        .select(
          "companies.*",
          calculated_price
        )
        .includes(:company_score)
        .includes(:company_price_closes)
    end

    private

    # This only works if it is part of a query that is also joined to performance_units (or includes them)
    def calculated_price
      <<-SQL
        (SELECT company_price_closes.price
          FROM company_price_closes
          INNER JOIN companies comps
          ON companies.id = company_price_closes.company_id
          ORDER BY company_price_closes.date DESC
        ) as "price"
      SQL
    end
  end
end
