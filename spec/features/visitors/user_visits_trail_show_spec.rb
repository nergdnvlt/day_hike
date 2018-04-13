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
end
