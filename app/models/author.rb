class Author < ApplicationRecord
  has_many :books

  def self.ordered_by_create
    Author.order(created_at: :asc)
  end
end
