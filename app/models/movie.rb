class Movie < ActiveRecord::Base
  has_many :favorite_movies
  has_many :favorited_by, through: :favorite_movies, source: :user
  belongs_to :user
  has_many :reviews
  
  validates :tmdbID, uniqueness: true, presence: true
  serialize :genres

  def self.search(search)
    if search.present?
      where('title LIKE ?', "%#{search}%")
    else
      all.order(:title)
    end
  end
end
