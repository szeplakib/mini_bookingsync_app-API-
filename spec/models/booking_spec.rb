require 'rails_helper'

RSpec.describe Booking, type: :model do
    it { should belong_to(:rental) }
    it { should validate_presence_of(:client_email) }
end