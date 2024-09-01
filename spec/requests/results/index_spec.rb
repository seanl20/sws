# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /results", type: :request do
  def json
    JSON.parse(response.body)
  end

  subject(:results) { get "/results" }

  context "when records doesn't exists" do
    it "returns empty results" do
      results

      expect(response).to have_http_status(200)
      expect(json["results"]).to be_empty
    end
  end

  context "when records exists" do
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
      results

      expect(response).to have_http_status(200)
      expect(json["results"]).to match_unordered_elements(
        {
          "id" => company_1.id,
          "name" => "Test01",
          "unique_symbol_code" => "TST:TST",
          "share_price" => 15.0,
          "overall_snowflake_score" => {
            "score_dividend" => 0,
            "score_future" => 5,
            "score_health" => 4,
            "score_past" => 0,
            "score_value" => 0
          },
          "score_management" => 0,
          "score_total" => 9,
          "company_price_closes" => [
            {
              "date" => 2.day.ago.to_date.to_s,
              "price" => 20.0
            },
            {
              "date" => 1.day.ago.to_date.to_s,
              "price" => 15.0
            }
          ]
        }, {
          "id" => company_2.id,
          "name" => "Test01",
          "unique_symbol_code" => "TST:TST",
          "share_price" => 20.0,
          "overall_snowflake_score" => {
            "score_dividend" => 0,
            "score_future" => 5,
            "score_health" => 4,
            "score_past" => 0,
            "score_value" => 0
          },
          "score_management" => 0,
          "score_total" => 9,
          "company_price_closes" => [
            {
              "date" => 3.day.ago.to_date.to_s,
              "price" => 25.0
            },
            {
              "date" => 2.day.ago.to_date.to_s,
              "price" => 20.0
            }
          ]
        }, {
          "id" => company_3.id,
          "name" => "Test01",
          "unique_symbol_code" => "TST:TST",
          "share_price" => 24.0,
          "overall_snowflake_score" => {
            "score_dividend" => 0,
            "score_future" => 5,
            "score_health" => 4,
            "score_past" => 0,
            "score_value" => 0
          },
          "score_management" => 0,
          "score_total" => 9,
          "company_price_closes" => [
            {
              "date" => 4.day.ago.to_date.to_s,
              "price" => 28.0
            },
            {
              "date" => 3.day.ago.to_date.to_s,
              "price" => 24.0
            }
          ]
        }
      )
    end
  end
end
