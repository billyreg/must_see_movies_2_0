class Director < ApplicationRecord
  # Direct associations

  has_many   :filmographies,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
