module Queries
  class Results
    def call
      companies = company_repo.get_all
    end

    private

    def company_repo
      Repositories::CompanyRepo.new
    end
  end
end
