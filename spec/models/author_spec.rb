require 'rails_helper'

RSpec.describe Author do
  it {should have_many :books}
  it {should validate_presence_of :name}
  it {should validate_presence_of :number_books}
  it {should allow_value(true).for(:alive)}
  it {should allow_value(false).for(:alive)}
end
