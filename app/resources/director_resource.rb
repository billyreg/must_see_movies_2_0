class DirectorResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :image, :string
  attribute :dob, :date
  attribute :name, :string
  attribute :bio, :string

  # Direct associations

  has_many   :filmographies

  # Indirect associations

  many_to_many :filmography,
               resource: MovieResource

end
