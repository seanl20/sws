module Queries
  class Results
    def call
      companies = company_repo.get_results

      map_companies(companies:)
    end

    def map_companies(companies:)
      results = companies.map do |company|
        {
          id: company.id,
          name: company.name,
          unique_symbol_code: company.unique_symbol,
          share_price: company.price,
          score_dividend: company.company_score.dividend,
          score_future: company.company_score.future,
          score_health: company.company_score.health,
          score_management: company.company_score.management,
          score_past: company.company_score.past,
          score_value: company.company_score.value,
          score_total: company.company_score.total
        }
      end

      puts "TEST"
      puts results.inspect

      results
    end

    private

    def company_repo
      Repositories::CompanyRepo.new
    end
  end
end