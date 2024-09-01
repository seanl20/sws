class ResultsController < ApplicationController
  # schema(:index) do
  # optional(:sort_by).value(Types::Strict::String)
  # optional(:sort_direction).value(Types::SortDirections)
  # optional(:sort_price_fluctuations).value(Types::SortDirections)
  # optional(:exchange_symbol).value(Types::Strict::String)
  # optional(:overall_score).value(Types::Strict::String)
  #   optional(:page).value(:integer, gteq?: 1)
  #   optional(:per_page).value(:integer, gteq?: 1, lteq?: 100)
  # end

  def index
    results = Queries::Results.new.call

    @pagy, @results = pagy(results)
  end
end
