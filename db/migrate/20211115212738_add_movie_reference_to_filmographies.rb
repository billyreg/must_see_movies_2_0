class AddMovieReferenceToFilmographies < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :filmographies, :movies
    add_index :filmographies, :movie_id
    change_column_null :filmographies, :movie_id, false
  end
end
