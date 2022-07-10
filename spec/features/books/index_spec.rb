require 'rails_helper'

RSpec.describe 'the books index page' do
  it 'displays books title' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: false)
    visit "/books"

    expect(page).to have_content(book.title)
    expect(page).to have_content(book2.title)
  end

  it 'displays book attributes' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    visit "/books"

    expect(page).to have_content(book.publication_date)
    expect(page).to have_content(book.fiction)
    expect(page).to have_content(book.created_at)
    expect(page).to have_content(book.updated_at)
  end

  it "links to books index user story 8" do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    visit '/authors'
    click_link 'Books'

    expect(page).to have_link("Books", :href=>"/books")
  end
end
