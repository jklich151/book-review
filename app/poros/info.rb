class Info
  attr_reader :title,
              :author,
              :publisher

  def initialize(attributes)
    @title = attributes[:title_suggest]
    @author = attributes[:author_name]
    @publisher = attributes[:publisher]
  end
end
