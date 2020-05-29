class SearchController < ApplicationController
  def index
    title = (params[:title])
    search_results = SearchFacade.new
    @book_info = search_results.book_info(title)



   conn_2 = Faraday.new(url: "https://api.nytimes.com") do |faraday|
     faraday.params["api-key"] = ENV['BOOK_KEY']
     faraday.params['title'] = title
   end

   response_2 = conn_2.get("/svc/books/v3/reviews.json")

   json_2 = JSON.parse(response_2.body, symbolize_names: true)

   @number = json_2[:num_results]
   @reviews = json_2[:results]
  end
end
