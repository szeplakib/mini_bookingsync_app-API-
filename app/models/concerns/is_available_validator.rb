# validates the availability of a date
class IsAvailableValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    bookings = Booking.where(['rental_id =?', record.rental_id])
    reserved = bookings.map { |e| [e.start_at, e.end_at] }
    reserved.each do |range|
      if value.between?(range[0], range[1]) || (value < range[0] && range [0] < record.end_at)
        record.errors.add(attribute, 'Date not available')
      end
    end
  end
end
