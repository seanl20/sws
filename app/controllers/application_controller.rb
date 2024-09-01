class ApplicationController < ActionController::API
  include Pagy::Backend

  def pagination_params
    {
      page: safe_params[:page],
      items: safe_params[:per_page]
    }.compact
  end

  def pagy_with_params(collection, vars = {})
    pagy(collection, vars.merge(pagination_params))
  end
end
