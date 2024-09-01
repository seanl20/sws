json.results do
  json.array! @results do |result|
    json.id result.id
    json.name result.name
    json.unique_symbol_code result.unique_symbol
    json.share_price result.price
    json.overall_snowflake_score do
      json.score_dividend result.company_score.dividend
      json.score_future result.company_score.future
      json.score_health result.company_score.health
      json.score_past result.company_score.past
      json.score_value result.company_score.value
    end
    json.score_management result.company_score.management
    json.score_total result.company_score.total
    json.company_price_closes result.company_price_closes do |price_close|
      json.date price_close.date
      json.price price_close.price
    end
  end
end

if @pagy.present?
  json.pagination do
    json.page @pagy.page
    json.total_results @pagy.count
    json.has_next_page @pagy.next.present?
  end
end
