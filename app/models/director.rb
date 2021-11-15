class Director < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :filmographies,
             :dependent => :destroy

  # Indirect associations

  has_many   :filmography,
             :through => :filmographies,
             :source => :movie

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
