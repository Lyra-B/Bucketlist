require 'rails_helper'

RSpec.describe Traveller, type: :model do
  it { should have_many :bucket_list_items }
  it { should have_many(:activities).through(:bucket_list_items)}
  it { should have_many(:destinations).through(:activities)}
end
