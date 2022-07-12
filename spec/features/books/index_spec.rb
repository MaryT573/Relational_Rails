require 'rails_helper'

RSpec.describe 'the books index page' do
  it 'displays books title user story 3' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: true)
    visit "/books"

    expect(page).to have_content(book.title)
    expect(page).to have_content(book2.title)
  end

  it 'displays book attributes user story 3' do
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
    click_on "Books"

    expect(current_path).to eq("/books")
  end

  it "only displays books with fiction == true user story 15" do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: false)
    visit "/books"

    expect(page).to have_content(book.title)
    expect(page).to_not have_content(book2.title)
  end

  it 'links to edit page from each book instance user story 18' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: false)
    visit "/books"
    click_link "Edit #{book.title}"
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
end
