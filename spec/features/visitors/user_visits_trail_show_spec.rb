require 'rails_helper'

describe 'A user visits the trail pages' do
  describe 'shows all trail info' do
    it 'for each trail' do
      trail1 = Trail.create!(length: 60, name: 'incline', address: '123')

      visit trail_path(trail1)

      expect(page).to have_content(trail1.length)
      expect(page).to have_content(trail1.name)
      expect(page).to have_content(trail1.address)
    end
  end

  describe 'shows total trips' do
    it 'for each trail' do
      trail1 = Trail.create!(length: 60, name: 'incline', address: '123')
      trip1 = trail1.trips.create(name: 'bobs trail', start_date: Time.now, end_date: Time.now)
      trip2 = trail1.trips.create!(name: 'lopsa', start_date: Time.now, end_date: Time.now)

      visit trail_path(trail1)

      expect(page).to have_content('Total Trips: 2')
    end
  end
end
