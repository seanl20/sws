# frozen_string_literal: true

module Commands
  class CompanyScoreCsvImport
    require "csv"

    def call
      company_score_csv_text = read_company_score_csv_file
      company_score_csv = parse_to_csv(csv_text: company_score_csv_text)

      batch_create_company_score(company_score_csv:)
    end

    def batch_create_companies(company_csv:)
      company_csv.lazy.each_slice(Types::BATCH_SIZE) do |csv_rows|
        Repositories::CompanyRepo.new.batch_create(csv_rows.map(&:to_hash))
      end
    end

    def read_company_score_csv_file
      File.read(Rails.root.join("lib", "csv_files", "company_score.csv"))
    end

    def parse_to_csv(csv_text:)
      CSV.parse(csv_text, headers: true, encoding: "ISO-8859-1")
    end

    def batch_create_company_score(company_score_csv:)
      company_score_csv.lazy.each_slice(Types::BATCH_SIZE) do |csv_rows|
        Repositories::CompanyScoreRepo.new.batch_create(csv_rows.map(&:to_hash))
      end
    end
  end
end
