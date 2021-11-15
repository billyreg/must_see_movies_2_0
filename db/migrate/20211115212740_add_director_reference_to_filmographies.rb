class AddDirectorReferenceToFilmographies < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :filmographies, :directors
    add_index :filmographies, :director_id
    change_column_null :filmographies, :director_id, false
  end
end
