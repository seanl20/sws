require "rails_helper"

RSpec.describe Repositories::CompanyScoreRepo do
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
          "date_generated" => "2020-05-24 11:06:28.000000",
          "dividend" => 0,
          "future" => 5,
          "health" => 4,
          "management" => 0,
          "past" => 0,
          "value" => 0,
          "misc" => 0,
          "total" => 9,
          "sentence" => "Test Sentence"
        }, {
          "company_id" => company_2.id,
          "date_generated" => "2020-05-24 11:06:28.000000",
          "dividend" => 0,
          "future" => 5,
          "health" => 4,
          "management" => 0,
          "past" => 0,
          "value" => 0,
          "misc" => 0,
          "total" => 9,
          "sentence" => "Test Sentence"
        }, {
          "company_id" => company_3.id,
          "date_generated" => "2020-05-24 11:06:28.000000",
          "dividend" => 0,
          "future" => 5,
          "health" => 4,
          "management" => 0,
          "past" => 0,
          "value" => 0,
          "misc" => 0,
          "total" => 9,
          "sentence" => "Test Sentence"
        }
      ]
    end

    it "batch_create company" do
      expect { batch_create }.to change { CompanyScore.count }.by(3)
      expect(CompanyScore.all.pluck(:company_id)).to match_unordered_elements(company_1.id, company_2.id, company_3.id)
    end
  end
end
