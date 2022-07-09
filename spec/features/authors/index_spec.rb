require 'rails_helper'

RSpec.describe 'the authors index page' do
  it 'displays authors name' do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    auth2 = Author.create!(name: "Will Smith", alive: true, number_books: 20)
    visit "/authors"

    expect(page).to have_content(auth.name)
    expect(page).to have_content(auth2.name)
  end

end
