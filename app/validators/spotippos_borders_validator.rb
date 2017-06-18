class SpotipposBordersValidator < ActiveModel::Validator
  def validate(record)
    if record.x < 0 || record.x > 1400 || record.y < 0 || record.y > 1000
      record.errors[:base] << 'outside the borders of Spotippos'
    end
  end
end
