class Review
  attr_reader :reviews,
              :number

  def initialize(attributes)
    @reviews = parse_reviews(attributes)
    @number = attributes[:num_results]
  end

  def parse_reviews(attributes)
    reviews = {}
    attributes[:results].each do |result|
      reviews[result[:publication_dt]] = result[:summary]
    end
    reviews
  end
end
