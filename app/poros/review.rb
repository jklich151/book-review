class Review
  attr_reader :summary

  def initialize(attributes)
    @summary = attributes[:summary]
  end
end
