class ResultsController < ApplicationController
  schema(:index) do
    # optional(:sort_by).value(Types::Strict::String)
    # optional(:sort_direction).value(Types::SortDirections)
    # optional(:sort_price_fluctuations).value(Types::SortDirections)
    # optional(:exchange_symbol).value(Types::Strict::String)
    # optional(:overall_score).value(Types::Strict::String)
  end

  def index
    @results = Queries::Results.new.call
  end

  private

  def cursor_pagination(collection, pagination_options = {})
    paginator = collection.cursor_paginate(**pagination_options)
    page = paginator.fetch
    records = page.records
    [page, records]
  end

  def cursor_pagination_params
    {
      order: {
        safe_params.to_h.fetch(:sort_by, :calculated_start_time) => safe_params.to_h.fetch(:sort_direction, :desc)
      },
      after: safe_params[:cursor]
    }.compact
  end
end