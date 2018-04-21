# Class for Booking model
class Booking < ApplicationRecord
  include ::BookingConcern
  belongs_to :rental
  before_save :downcase_email
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :client_email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL }
  validates :start_at,
            presence: true,
            is_available: true,
            is_start_before_end: true
  validates :end_at,
            presence: true,
            is_available: true
end