class Movie < ActiveRecord::Base
  has_many :favorite_movies
  has_many :favorited_by, through: :favorite_movies, source: :user
  
  validates :tmdbID, uniqueness:true
end
