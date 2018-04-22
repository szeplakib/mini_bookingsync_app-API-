# Validates that price relates to staying duration, and daily rate. Every started day billed.
class IsCorrectPriceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.start_at && record.end_at && record.rental_id
      duration = sec_to_day(record.end_at - record.start_at)
      valid_price = duration.ceil * Rental.find(record.rental_id).daily_rate
    else
      record.errors.add(attribute, "Missing attributes.")
    end
    unless value == valid_price
      record.errors.add(attribute, "Price is not related to booking length or Rental's daily rate")
    end
  end

  def sec_to_day(sec)
    sec/86400
  end
end