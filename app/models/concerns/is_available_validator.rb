# validates the availability of a date
class IsAvailableValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    bookings = Booking.where('rental_id = ? AND id <> ?', record.rental_id, record.id)
    bookings.each do |booking|
      if value.between?(booking.start_at, booking.end_at) || (value < booking.start_at && booking.end_at < record.end_at)
        record.errors.add(attribute, 'Date not available')
      end
    end
  end
end
