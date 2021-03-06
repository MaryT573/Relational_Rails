require 'rails_helper'

RSpec.describe 'the authors show page' do
  it 'displays authors name user story 2' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    visit "/authors/#{auth.id}"

    expect(page).to have_content(auth.name)
  end

  it 'displays attributes user story 2' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)

    visit "/authors/#{auth.id}"

    expect(page).to have_content(auth.alive)
    expect(page).to have_content(auth.number_books)
    expect(page).to have_content(auth.created_at)
    expect(page).to have_content(auth.updated_at)
  end

  it 'displays count of books user story 7' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: false)
    visit "/authors/#{auth.id}"

    expect(page).to have_content("Number of Books in Catalog: 2")
  end

  it "links to authors book user story 10" do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    visit "/authors/#{auth.id}"
    expect(page).to have_link("Author's Book")
    click_on "Author's Book"
    expect(current_path).to eq("/authors/#{auth.id}/books")
  end

  it 'can update author information user story 12' do
    auth = Author.create!(name: "john doe", alive: true, number_books: 10)
    visit "/authors/#{auth.id}"
    click_link "Update Author"
    expect(current_path).to eq("/authors/#{auth.id}/edit")
    fill_in 'name', with: 'Carl'
    fill_in 'number_books', with: 20
    select 'dead', from: 'alive'
    click_on 'Submit Changes'
    expect(current_path).to eq("/authors/#{auth.id}")
    expect(page).to have_content('Carl')
    expect(page).to have_content('Number of Books: 20')
    expect(page).to have_content('Is author living?: false')
  end

  it "can delete authors user story 19" do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    auth2 = Author.create!(name: "Will Smith", alive: true, number_books: 20)
    visit "/authors"
    expect(page).to have_content(auth.name)
    visit "/authors/#{auth.id}"
    click_link "Delete Author"
    expect(current_path).to eq("/authors")
    expect(page).to_not have_content(auth.name)
    expect(page).to have_content(auth2.name)
  end

  it "can delete authors  and books user story 19" do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    auth2 = Author.create!(name: "Will Smith", alive: true, number_books: 20)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: false)
    visit "/authors"
    expect(page).to have_content(auth.name)
    visit "/authors/#{auth.id}"
    click_link "Delete Author"
    expect(current_path).to eq("/authors")
    expect(page).to_not have_content(auth.name)
    expect(page).to_not have_content(book.title)
    expect(page).to_not have_content(book2.title)
  end
end
