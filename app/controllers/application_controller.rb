class ApplicationController < ActionController::API
  def cursor_pagination(collection, pagination_options = {})
    paginator = collection.cursor_paginate(**pagination_options)

    page = paginator.fetch
    records = page.records

    [page, records]
  end
end
