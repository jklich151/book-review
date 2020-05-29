class SearchController < ApplicationController
  def index
    title = params[:title]

   conn = Faraday.new(url: "http://openlibrary.org") do |faraday|
    faraday.params['title'] = title
   end

   response = conn.get("/search.json?")

   json = JSON.parse(response.body, symbolize_names: true)
   @book_info = json[:docs][0]


   conn_2 = Faraday.new(url: "https://api.nytimes.com") do |faraday|
     faraday.params["api-key"] = ENV['BOOK_KEY']
     faraday.params['title'] = title
   end

   response_2 = conn_2.get("/svc/books/v3/reviews.json")

   json_2 = JSON.parse(response_2.body, symbolize_names: true)

  end
end
