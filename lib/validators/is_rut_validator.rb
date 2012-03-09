class IsRutValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "Invalid" ) unless value.valid?
  end
end