require 'rails_helper'

RSpec.describe Destination, type: :model do
  it { should have_many :activities }
end
