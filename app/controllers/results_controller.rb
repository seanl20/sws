class ResultsController < ApplicationController
  # TODO add functionlity for some sorting and filter to the API.
  schema(:index) do
    optional(:include_prices).value(:bool)
  end

  def index
    @results = Queries::Results.new.call

    @prices_data = safe_params[:include_prices]
  end
end
