require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'Relationships' do
    it { should have_many(:trails) }
    it { should have_many(:trip_trails) }
  end

  describe 'instance methods' do
    it 'calculates total length' do
      trip = Trip.create(name: 'bobs trail', start_date: Time.now, end_date: Time.now)
      trail1 = trip.trails.create!(length: 60, name: 'incline', address: '123')
      trail2 = trip.trails.create!(length: 25, name: 'decline', address: '456')

      expect(trip.total_planned_distance).to eq(85)
    end
  end
end
