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
