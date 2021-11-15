class Movie < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :filmographies,
             :dependent => :destroy

  has_many   :roles,
             :dependent => :destroy

  # Indirect associations

  has_many   :bookmark_users,
             :through => :bookmarks,
             :source => :user

  has_many   :reviewing_users,
             :through => :reviews,
             :source => :user

  has_many   :directors,
             :through => :filmographies,
             :source => :director

  has_many   :cast,
             :through => :roles,
             :source => :actor

  # Validations

  # Scopes

  def to_s
    title
  end

end
