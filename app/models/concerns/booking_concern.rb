module BookingConcern
  extend ActiveSupport::Concern

  private

  def downcase_email
    self.client_email.downcase!
  end
end