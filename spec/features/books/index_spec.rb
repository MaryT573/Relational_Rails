require 'rails_helper'

RSpec.describe 'the books index page' do
  it 'displays books title' do
    book = Book.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = Book.create!(title: "Why", publication_date: 1667, fiction: false)
    visit "/books"

    expect(page).to have_content(book.title)
    expect(page).to have_content(book2.title)
  end

  it 'displays book attributes' do
    book = Book.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    visit "/books"

    expect(page).to have_content(book.publication_date)
    expect(page).to have_content(book.fiction)
    expect(page).to have_content(book.created_at)
    expect(page).to have_content(book.updated_at)
  end

end
