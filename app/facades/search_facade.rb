class SearchFacade
  def book_info(title)
    json = BookService.new.info_on_book(title)

    @book_info = json[:docs].map do |book_data|
      Info.new(book_data)
    end
  end
end
