class CreateFavoriteMovies < ActiveRecord::Migration
  def change
    create_table :favorite_movies do |t|
      t.integer :tmdbID
      t.string :email


      t.timestamps null: false
    end
  end
end
