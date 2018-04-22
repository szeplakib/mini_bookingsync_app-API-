# Defines methods for Booking model
module BookingConcern
  extend ActiveSupport::Concern

  private

  def downcase_email
    self.client_email.downcase!
  end
end
