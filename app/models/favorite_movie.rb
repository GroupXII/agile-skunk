class FavoriteMovie < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  
  validates :user_id,  uniqueness:  {scope: :movie_id, message: "already favorited" }
end
