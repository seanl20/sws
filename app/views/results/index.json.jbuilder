json.results do
  json.array! @results do |result|
    json.id result[:id]
    json.name result[:name]
    json.unique_symbol_code result[:unique_symbol_code]
    json.share_price result[:share_price]
    json.score_dividend result[:score_dividend]
    json.score_future result[:score_future]
    json.score_health result[:score_health]
    json.score_management result[:score_management]
    json.score_past result[:score_past]
    json.score_value result[:score_value]
    json.score_total result[:score_total]
  end
end
