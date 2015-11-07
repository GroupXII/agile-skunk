class RemoveimdbIdFromMovies < ActiveRecord::Migration
  def up
    remove_column :Movies, :imdbID
  end
end
