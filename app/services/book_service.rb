class BookService
  def info_on_book(title)
    response = conn.get("/search.json?") do |req|
      req.params['title'] = title
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://openlibrary.org")
  end
end
