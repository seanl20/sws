json.results do
  json.array! @results do |result|
    json.id result.id
    json.name result.name
    json.unique_symbol_code result.unique_symbol
    json.share_price result.price
    json.score_dividend result.company_score.dividend
    json.score_future result.company_score.future
    json.score_health result.company_score.health
    json.score_management result.company_score.management
    json.score_past result.company_score.past
    json.score_value result.company_score.value
    json.score_total result.company_score.total
  end
end

json.pagination do
  json.page @pagy.page
  json.total_results @pagy.count
  json.has_next_page @pagy.next.present?
end if @pagy.present?
