FactoryBot.define do
  factory :company_price_close, class: CompanyPriceClose do
    association :company
    date { "2020-03-25" }
    price { 15.0 }
    date_created { "2020-03-25 01:01:16.7966667" }
  end
end
