class SearchesController < ApplicationController

  def results
    @query = params[:q]

    @search_type = params[:type]

    if @search_type == ""
      @search_results = Product.where('name LIKE ?', "%#{@query}%")
    else
      @search_results = Product.where('(name LIKE ?) AND category_id = ?', "%#{@query}%", @search_type)
    end

    @results_count = @search_results.count
    @search_results = @search_results.page(params[:page])
  end
end
