class Rental < ApplicationRecord
    has_many :bookings, dependent: :destroy
    validates :name, presence: true, length: { maximum: 255 }
end
