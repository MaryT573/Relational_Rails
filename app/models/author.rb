class Author < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :number_books
  validates :alive, inclusion: [true, false]
  has_many :books, dependent: :destroy

  def self.ordered_by_create
    order(created_at: :asc)
  end

end
