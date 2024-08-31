FactoryBot.define do
  factory :company_score, class: CompanyScore do
    association :company
    date_generated { "2020-05-24 11:01:59.000000" }
    dividend { 0 }
    future { 5 }
    health { 4 }
    management { 0 }
    past { 0 }
    value { 0 }
    misc { 0 }
    total { 9 }
    sentence { "Test Sentence" }
  end
end
