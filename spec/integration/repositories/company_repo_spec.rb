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

  describe "#get_all" do
    subject(:get_all) do
      described_class.new.get_all
    end

    context "when company exists" do
      let!(:company_1) { FactoryBot.create(:company) }
      let!(:company_2) { FactoryBot.create(:company) }
      let!(:company_3) { FactoryBot.create(:company) }
  
      let!(:company_score_1) { FactoryBot.create(:company_score, company: company_1) }
      let!(:company_score_2) { FactoryBot.create(:company_score, company: company_2) }
      let!(:company_score_3) { FactoryBot.create(:company_score, company: company_3) }
  
      let!(:company_1_company_price_close_1) { FactoryBot.create(:company_price_close, company: company_1, price: 20.0, date: 2.day.ago) }
      let!(:company_1_company_price_close_2) { FactoryBot.create(:company_price_close, company: company_1, price: 15.0, date: 1.day.ago) }

      let!(:company_2_company_price_close_1) { FactoryBot.create(:company_price_close, company: company_2, price: 25.0, date: 3.day.ago) }
      let!(:company_2_company_price_close_2) { FactoryBot.create(:company_price_close, company: company_2, price: 20.0, date: 2.day.ago) }

      let!(:company_3_company_price_close_1) { FactoryBot.create(:company_price_close, company: company_3, price: 28.0, date: 4.day.ago) }
      let!(:company_3_company_price_close_2) { FactoryBot.create(:company_price_close, company: company_3, price: 24.0, date: 3.day.ago) }
      
      it "returns companies" do
        expect(get_all.map(&:id)).to match_unordered_elements(company_1.id, company_2.id, company_3.id)
        expect(get_all.map(&:price)).to match_unordered_elements(15.0, 20.0, 24.0)
        expect(get_all.map(&:company_score).map(&:company_id)).to match_unordered_elements(company_1.id, company_2.id, company_3.id)
      end
    end
    
    context "when company does not exist" do
      it "returns empty array" do
        expect(get_all).to be_empty
      end
    end
  end
end
