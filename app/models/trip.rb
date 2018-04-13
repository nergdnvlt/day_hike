class Trip < ApplicationRecord
  has_many :trip_trails, dependent: :destroy
  has_many :trails, through: :trip_trails

  def total_planned_distance
    trails.sum(:length)
  end

  def average_distance
    trails.average(:length)
  end

  def max
    trails.maximum(:length)
  end

  def min
    trails.minimum(:length)
  end
end
