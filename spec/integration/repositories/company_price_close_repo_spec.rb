require "rails_helper"

RSpec.describe Repositories::CompanyPriceCloseRepo do
  describe "#batch_create" do
    subject(:batch_create) do
      described_class.new.batch_create(attrs)
    end

    let!(:company_1) { FactoryBot.create(:company) }
    let!(:company_2) { FactoryBot.create(:company) }
    let!(:company_3) { FactoryBot.create(:company) }

    let!(:attrs) do
      [
        {
          "company_id" => company_1.id,
          "date" => "2020-03-25",
          "price" => 15.0,
          "date_created" => "2020-03-25 01:01:16.7966667"
        }, {
          "company_id" => company_2.id,
          "date" => "2020-03-25",
          "price" => 10.0,
          "date_created" => "2020-03-25 01:01:16.7966667"
        }, {
          "company_id" => company_3.id,
          "date" => "2020-03-25",
          "price" => 5.0,
          "date_created" => "2020-03-25 01:01:16.7966667"
        }
      ]
    end

    it "batch_create company" do
      expect { batch_create }.to change { CompanyPriceClose.count }.by(3)
      expect(CompanyPriceClose.all.pluck(:company_id)).to match_unordered_elements(company_1.id, company_2.id, company_3.id)
    end
  end
end
