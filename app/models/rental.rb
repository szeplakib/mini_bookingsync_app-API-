# Class for Rental model
class Rental < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name,
            presence: true,
            length: { maximum: 255 }
  validates :daily_rate,
            presence: true,
            numericality: { greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 100_000_000 }
end
