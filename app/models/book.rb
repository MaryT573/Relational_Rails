class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :publication_date
  validates :fiction, inclusion: [true, false] 
  belongs_to :author
end
