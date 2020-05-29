class SearchController < ApplicationController
  def index
    title = (params[:title])
    search_results = SearchFacade.new
    @book_info = search_results.book_info(title)

    search_results = SearchFacade.new
    @reviews = search_results.reviews(title)
    @number = json[:num_results]
  end
end
