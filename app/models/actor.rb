class Actor < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :roles,
             :dependent => :destroy

  # Indirect associations

  has_many   :filmography,
             :through => :roles,
             :source => :movie

  # Validations

  # Scopes

  def to_s
    dob
  end

end
