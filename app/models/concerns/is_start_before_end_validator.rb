class IsStartBeforeEndValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, 'End set before start') if value && (record.end_at < value)
  end
end