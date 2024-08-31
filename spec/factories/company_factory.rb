FactoryBot.define do
  factory :company, class: Company do
    name { "Test01" }
    ticker_symbol { "TST" }
    exchange_symbol { "TST" }
    unique_symbol { "TST:TST" }
    date_generated { "2020-05-24 11:01:59.000000" }
    security_name { "Shares" }
    exchange_country_iso { "AU" }
    listing_currency_iso { "AUD" }
    canonical_url { "/test/canonical/url/1" }
    unique_symbol_slug { "TST" }
  end
end
