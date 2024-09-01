# frozen_string_literal: true

module Repositories
  class CompanyScoreRepo
    def batch_create(batch_attrs)
      ActiveRecord::Base.transaction do
        batch_attrs.map do |attrs|
          company = Company.find(attrs["company_id"])

          CompanyScore.create!(
            company:,
            id: attrs["id"],
            date_generated: attrs["date_generated"],
            dividend: attrs["dividend"],
            future: attrs["future"],
            health: attrs["health"],
            management: attrs["management"],
            past: attrs["past"],
            value: attrs["value"],
            misc: attrs["misc"],
            total: attrs["total"],
            sentence: attrs["sentence"]
          )
        end
      end
    end
  end
end
