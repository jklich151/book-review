class SearchFacade
  def book_info(title)
    json = BookService.new.info_on_book(title)

    json[:docs].map do |book_data|
      Info.new(book_data)
    end
  end

  def reviews(title)
    json = TimesService.new.book_reviews(title)
    Review.new(json)
  end
end
