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

  has_many   :reviews

  has_many   :bookmarks

  has_many   :filmographies

  has_many   :roles

  # Indirect associations

  many_to_many :cast,
               resource: ActorResource

end
