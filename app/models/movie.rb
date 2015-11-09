class Movie < ActiveRecord::Base
  validates :tmdbID, uniqueness:true

  def self.search(search)
    if search.present?
      where('title LIKE ?', "%#{search}%")
    else
      all.order(:title)
    end
  end
end
