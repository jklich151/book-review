class TimesService
  def book_reviews(title)
    response = conn.get("/svc/books/v3/reviews.json") do |req|
      req.params['title'] = title
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.nytimes.com") do |faraday|
      faraday.params["api-key"] = ENV['BOOK_KEY']
    end
  end
end
