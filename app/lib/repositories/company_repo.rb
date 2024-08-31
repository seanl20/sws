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
  end
end