require 'rails_helper'

describe 'A user visits the trip#index page' do
  describe 'to link to the trip#show' do
    it 'shows all that trip info' do
      trip = Trip.create(name: 'bobs trail', start_date: Time.now, end_date: Time.now)
      trail1 = trip.trails.create!(length: 60, name: 'incline', address: '123')
      trail2 = trip.trails.create!(length: 25, name: 'decline', address: '456')

      visit trips_path

      click_link 'bobs trail'

      expect(page).to have_content(trail1.length)
      expect(page).to have_content(trail1.name)
      expect(page).to have_content(trail1.address)
      expect(page).to have_content(trail2.length)
      expect(page).to have_content(trail2.name)
      expect(page).to have_content(trail2.address)

    end
  end
end
