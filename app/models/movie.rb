class Movie < ActiveRecord::Base
  has_many :favorite_movies
  has_many :favorited_by, through: :favorite_movies, source: :user
  
  validates :tmdbID, uniqueness:true

  def self.search(search)
    if search.present?
      where('title LIKE ?', "%#{search}%")
    else
      all.order(:title)
    end
  end
end
