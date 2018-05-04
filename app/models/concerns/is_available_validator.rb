# validates the availability of a date
class IsAvailableValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.id
      bookings = Booking.where('rental_id = ? AND id <> ?', record.rental_id, record.id)
    else
      bookings = Booking.where('rental_id = ?', record.rental_id)
    end
    puts record.id
    bookings.each do |booking|
      if value.between?(booking.start_at, booking.end_at) || (value < booking.start_at && booking.end_at < record.end_at)
        record.errors.add(attribute, 'Date not available')
      end
    end
  end
end
