require 'rails_helper'

RSpec.describe 'the books show page' do
  it 'displays book and attributes user story 4' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    visit "/books/#{book.id}"

    expect(page).to have_content(book.title)
    expect(page).to have_content(book.publication_date)
    expect(page).to have_content(book.fiction)
    expect(page).to have_content(book.created_at)
    expect(page).to have_content(book.updated_at)
  end
end
