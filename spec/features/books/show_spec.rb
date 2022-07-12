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

  it 'can update book information user story 14' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    visit "/books/#{book.id}"
    click_link "Update Book"
    expect(current_path).to eq("/books/#{book.id}/edit")
    fill_in 'title', with: 'Cats!'
    fill_in 'publication_date', with: 1378
    select 'non-fiction', from: 'fiction'
    click_on 'Update Book'
    expect(current_path).to eq("/books/#{book.id}")
    expect(page).to have_content('Cats')
    expect(page).to have_content('Book published: 1378')
    expect(page).to have_content('Fiction?: false')
  end

  it 'it can delete book user story 20' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: true)
    visit "/books"
    expect(page).to have_content(book.title)
    visit "/books/#{book.id}"
    click_link "Delete Book"
    expect(current_path).to eq("/books")
    expect(page).to_not have_content(book.title)
    expect(page).to have_content(book2.title)
  end
end
