require 'rails_helper'

RSpec.describe 'the authors books index page' do
  it 'displays books title user story 5' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: false)
    visit "/authors/#{auth.id}/books"

    expect(page).to have_content(book.title)
    expect(page).to have_content(book2.title)
  end
end
