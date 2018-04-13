class Trail < ApplicationRecord
  has_many :trip_trails, dependent: :destroy
  has_many :trips, through: :trip_trails

  def total_trips
    trips.all.count
  end
end
