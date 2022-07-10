require 'rails_helper'

RSpec.describe 'the authors index page' do
  it 'displays authors name' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    auth2 = Author.create!(name: "Will Smith", alive: true, number_books: 20)
    visit "/authors"

    expect(page).to have_content(auth.name)
    expect(page).to have_content(auth2.name)
  end

  it 'sorts by most recently created' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    auth2 = Author.create!(name: "Will Smith", alive: true, number_books: 20)
    visit "/authors"
    auth3 = Author.create!(name: "whoever", alive: true, number_books: 20)
    visit "/authors"

    expect(auth.name).to appear_before(auth2.name)
    expect(auth.name).to appear_before(auth3.name)
    expect(auth2.name).to appear_before(auth3.name)
  end
end
