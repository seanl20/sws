require "rails_helper"

RSpec.describe Repositories::CompanyRepo do
  describe "#batch_create" do
    subject(:batch_create) do
      described_class.new.batch_create(attrs)
    end

    let!(:attrs) do
      [
        {
          id: SecureRandom.uuid,
          name: "test01",
          ticker_symbol: "TST",
          exchange_symbol: "TST",
          unique_symbol: "TST:TST",
          date_generated: "2020-05-24 11:01:59.000000",
          security_name: "Shares",
          exchange_country_iso: "AU",
          listing_currency_iso: "AUD",
          canonical_url: "/test/canonical/url/1",
          unique_symbol_slug: "TST",
          score_id: 1
        },{
          id: SecureRandom.uuid,
          name: "test01",
          ticker_symbol: "TST",
          exchange_symbol: "TST",
          unique_symbol: "TST:TST",
          date_generated: "2020-05-24 11:01:59.000000",
          security_name: "Shares",
          exchange_country_iso: "AU",
          listing_currency_iso: "AUD",
          canonical_url: "/test/canonical/url/1",
          unique_symbol_slug: "TST",
          score_id: 26507
        },{
          id: SecureRandom.uuid,
          name: "test01",
          ticker_symbol: "TST",
          exchange_symbol: "TST",
          unique_symbol: "TST:TST",
          date_generated: "2020-05-24 11:01:59.000000",
          security_name: "Shares",
          exchange_country_iso: "AU",
          listing_currency_iso: "AUD",
          canonical_url: "/test/canonical/url/1",
          unique_symbol_slug: "TST",
          score_id: 26507
        }
      ]
    end

    it "batch_create company" do
      expect { batch_create }.to change { Company.count }.by(3)
    end
  end
end
