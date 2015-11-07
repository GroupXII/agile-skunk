class Movie < ActiveRecord::Base
  validates :tmdbID, uniqueness:true
end
