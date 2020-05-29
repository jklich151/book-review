class SearchFacade
  def book_info(title)
    json = BookService.new.info_on_book(title)

    @book_info = json[:docs].map do |book_data|
      Info.new(book_data)
    end
  end

  def reviews(title)
    json = TimesService.new.book_reviews(title)

    @reviews = json[:results].map do |review_data|
      Review.new(review_data)
    end
  end
end
