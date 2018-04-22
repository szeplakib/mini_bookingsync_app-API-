# Validates that price relates to staying duration, and daily rate.
# Every started day billed.
class IsCorrectPriceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.start_at && record.end_at && record.rental_id
      duration = sec_to_day(record.end_at - record.start_at)
      valid_price = duration.ceil * Rental.find(record.rental_id).daily_rate
    else
      message = 'Missing attributes.'
      record.errors.add(attribute, message)
    end
    unless value == valid_price
      message = "Price is not related to booking length or Rental's daily rate"
      record.errors.add(attribute, message)
    end
  end

  def sec_to_day(sec)
    sec / 86_400
  end
end
