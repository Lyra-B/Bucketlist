require 'rails_helper'

RSpec.describe Activity, type: :model do
  it { should belong_to :destination }
  it { should have_many :bucket_list_items }

  describe "Geocoding an Activity" do
    before do
      @india = Destination.create!(:name => "India")
      @activity = Activity.create!(:name => "Ride an Elephant",
        :location => "Bombay", :destination => @india)
    end

    it "geocodes the activity using the location and destination" do
      # expect(@activity.latitude.round(7).to_f).to eq(19.0759837)
      # expect(@activity.longitude.round(7).to_f).to eq(72.8776559)
      expect(@activity.latitude.round(7)).to eq(BigDecimal.new(19.0759837, 9))
      expect(@activity.longitude.round(7)).to eq(BigDecimal.new(72.8776559, 9))
    end

    it "generates an input string for use with the Google API" do
      expect(@activity.send(:geocode_input)).to eq("Bombay, India")
    end
  end
end
