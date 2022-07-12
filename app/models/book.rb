class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :publication_date
  validates :fiction, inclusion: [true, false]
  belongs_to :author

  def self.true_bool
    where(fiction: true)
  end

  def self.sort_alpha
    order(:title)
  end
end
