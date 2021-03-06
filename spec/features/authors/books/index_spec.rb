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

  it "creates a new book associated with author user story 13" do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    visit "/authors/#{auth.id}/books"
    click_link 'New Book'
    expect(current_path).to eq("/authors/#{auth.id}/books/new")
    fill_in 'title', with: 'Cats!'
    fill_in 'publication_date', with: 1378
    select 'non-fiction', from: 'fiction'
    click_on 'Create Book'
    visit "/authors/#{auth.id}/books"
    expect(page).to have_content('Cats')
    expect(page).to have_content('Book published: 1378')
    expect(page).to have_content('Fiction?: false')
  end

  it "has a link that can sort books in alphabetical order user story 16" do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: false)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    visit "/authors/#{auth.id}/books"
    click_on "Sort Alphabetically"
    expect(current_path).to eq("/authors/#{auth.id}/books")
    expect(book.title).to appear_before(book2.title)
  end

  it "links to edit page from each parent's book instance user story 18" do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: false)
    visit "/authors/#{auth.id}/books"
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

  it "can delete book instances from author's book index user story 23" do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: false)
    visit "/authors/#{auth.id}/books"
    expect(page).to have_content("Title: Titled Turtles: A love story")
    click_link "Delete #{book.title}"
    expect(current_path).to eq("/books")
    expect(page).to_not have_content(book.title)
  end

  it "can display books published after a certain year user story 21" do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: false)
    visit "/authors/#{auth.id}/books"
    expect(page).to have_content("Title: Titled Turtles: A love story")
    expect(page).to have_content("Why")
    fill_in 'published', with: '2000'
    click_on 'Submit Changes'
    expect(current_path).to eq("/authors/#{auth.id}/books")
    expect(page).to have_content("Title: Titled Turtles: A love story")
    expect(page).to_not have_content("Why")
  end
end
