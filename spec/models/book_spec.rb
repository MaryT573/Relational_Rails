require 'rails_helper'

RSpec.describe Book do
  it {should belong_to :author}
  it {should validate_presence_of :title}
  it {should validate_presence_of :publication_date}
  it {should allow_value(true).for(:fiction)}
  it {should allow_value(false).for(:fiction)}

  it "only shows books with a true value user story 15" do
    auth = Author.create!(name: "john doe", alive: false, number_books: 10)
    book = auth.books.create!(title: "Titled Turtles: A love story", publication_date: 2057, fiction: true)
    book2 = auth.books.create!(title: "Why", publication_date: 1667, fiction: false)

    expect(Book.true_bool).to eq([book])
  end
end
