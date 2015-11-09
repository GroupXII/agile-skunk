json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :imdbID, :tmdbID, :synopsis, :posterPath, :releaseDate, :status, :averageScore, :numVotes
  json.url movie_url(movie, format: :json)
end
