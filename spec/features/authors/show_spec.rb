require 'rails_helper'

RSpec.describe 'the authors show page' do
  it 'displays authors name' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    visit "/authors/#{auth.id}"

    expect(page).to have_content(auth.name)
  end

  it 'displays attributes' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    visit "/authors/#{auth.id}"

    expect(page).to have_content(auth.alive)
    expect(page).to have_content(auth.number_books)
    expect(page).to have_content(auth.created_at)
    expect(page).to have_content(auth.updated_at)
  end

  it 'displays count of books' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: false)
    visit "/authors/#{auth.id}"

    expect(page).to have_content("Number of Books: 2")
  end
end
