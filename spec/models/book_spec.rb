require 'rails_helper'

RSpec.describe Book do
  it {should belong_to :author}
  it {should validate_presence_of :title}
  it {should validate_presence_of :publication_date}
  it {should allow_value(true).for(:fiction)}
  it {should allow_value(false).for(:fiction)}
end
