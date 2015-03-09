require 'rails_helper'

RSpec.describe Activity, type: :model do
  it { should belong_to :destination }
  it { should have_many :bucket_list_items }
end
