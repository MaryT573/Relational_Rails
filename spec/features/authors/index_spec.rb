require 'rails_helper'

RSpec.describe 'the authors index page' do
  it 'displays authors name user story 1' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    auth2 = Author.create!(name: "Will Smith", alive: true, number_books: 20)
    visit "/authors"

    expect(page).to have_content(auth.name)
    expect(page).to have_content(auth2.name)
  end

  it 'sorts by most recently created user story 6' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    auth2 = Author.create!(name: "Will Smith", alive: true, number_books: 20)
    visit "/authors"
    auth3 = Author.create!(name: "whoever", alive: true, number_books: 20)
    visit "/authors"

    expect(auth.name).to appear_before(auth2.name)
    expect(auth.name).to appear_before(auth3.name)
    expect(auth2.name).to appear_before(auth3.name)
  end

  it "links to books index user story 9" do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    visit '/books'
    expect(page).to have_link("Authors")
    click_on "Authors"
    expect(current_path).to eq("/authors")
  end
end
