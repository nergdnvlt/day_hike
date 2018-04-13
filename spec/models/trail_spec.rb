require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe 'Relationships' do
    it { should have_many(:trips) }
    it { should have_many(:trip_trails) }
  end

  describe 'instance methods' do
    it 'calculates total length' do
      trail1 = Trail.create!(length: 60, name: 'incline', address: '123')
      trip1 = trail1.trips.create(name: 'bobs trail', start_date: Time.now, end_date: Time.now)
      trip2 = trail1.trips.create!(name: 'lopsa', start_date: Time.now, end_date: Time.now)

      expect(trail1.total_trips).to eq(2)
    end
  end
end
