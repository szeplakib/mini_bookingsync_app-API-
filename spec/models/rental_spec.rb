require 'rails_helper'

RSpec.describe Rental, type: :model do
    it { should have_many(:bookings).dependent(:destroy) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:daily_rate) }
end