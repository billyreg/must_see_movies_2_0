class User < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :reviewed_movies,
             :through => :reviews,
             :source => :movie

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
