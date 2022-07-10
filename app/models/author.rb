class Author < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :number_books
  validates :alive, inclusion: [true, false]
  has_many :books

  def self.ordered_by_create
    Author.order(created_at: :asc)
  end
end
