require 'rails_helper'

RSpec.describe BucketListItem, type: :model do
  it { should belong_to :activity }
  it { should belong_to :traveller }
end
