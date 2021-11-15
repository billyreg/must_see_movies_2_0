class MovieResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :year, :date
  attribute :duration, :integer
  attribute :description, :string
  attribute :image, :string

  # Direct associations

  has_many   :filmographies

  has_many   :roles

  # Indirect associations

end
