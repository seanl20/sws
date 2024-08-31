class ApplicationController < ActionController::API
  def pagy_with_params(collection, vars = {})
    pagy(collection, vars.merge(pagination_params))
  end
end
