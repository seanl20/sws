# frozen_string_literal: true

module Commands
  class CompanyPriceCloseCsvImport
    require "csv"

    def call
      company_price_close_csv_text = read_company_price_close_csv_file
      company_price_close_csv = parse_to_csv(csv_text: company_price_close_csv_text)

      batch_create_company_price_close(company_price_close_csv:)
    end

    def batch_create_companies(company_csv:)
      company_csv.lazy.each_slice(Types::BATCH_SIZE) do |csv_rows|
        Repositories::CompanyRepo.new.batch_create(csv_rows.map(&:to_hash))
      end
    end

    def read_company_price_close_csv_file
      File.read(Rails.root.join('lib','csv_files','company_price_close.csv'))
    end

    def parse_to_csv(csv_text:)
      CSV.parse(csv_text, headers: true, encoding: "ISO-8859-1")
    end

    def batch_create_company_price_close(company_price_close_csv:)
      company_price_close_csv.lazy.each_slice(Types::BATCH_SIZE) do |csv_rows|
        Repositories::CompanyPriceCloseRepo.new.batch_create(csv_rows.map(&:to_hash))
      end
    end
  end
end
