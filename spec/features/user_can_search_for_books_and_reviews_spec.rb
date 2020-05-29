require 'rails_helper'

RSpec.describe 'As a User' do
  it 'I can search for a book and see their info and reviews' do
    visit '/'

    fill_in :title, with: "Normal People"

    click_on "Find Book"

    expect(current_path).to eq('/search')

    within(first('.book-info')) do
      expect(page).to have_css('.title')
      expect(page).to have_css('.author')
      expect(page).to have_css('.publisher')
    end

    within ('.reviews') do
      expect(page).to have_content('This book has 2 reviews from the New York Times')
      expect(page).to have_css('.review-text')
    end
  end
end
# As a user
# When I visit "/"
# And I input "Normal People" into the form
# (Note: Use the existing search form)
# And I click "Find Book"
# Then I should be on page "/search"
# Then I should see the book's info

# For that book I should see
# - Title
# - Author
# - Publisher
# Example:
# Normal People by Sally Roony
# Published By:  Faber & Faber,
#                Hogarth,
#                Random House Large Print,
#                Knopf Canada

# I should also see:
# - This book has 2 reviews from the New York Times
#   (Note: reviews are the "summary" in the book review response)
# - Review 1: "Rooney's second novel tracks two gifted but troubled teenagers across four years of friendship and occasional romance."
# Review Publication Date: 2019-04-08
# - Review 2: "Like "Conversations With Friends," "Normal People" also traces a young romance in Ireland."
# Review Publication Date: 2019-04-15
