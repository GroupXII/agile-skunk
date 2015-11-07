require 'open-uri'
require 'json'
namespace :db do
  desc "Populates the Movie database with the tMDB API's popular and current movies"
  task :populate => :environment do
    api_key = '1bd66d1dc550b5a4cc3a9f2e2210eae9' # this is probably not a good idea.

    request_uri = 'https://api.themoviedb.org/3/movie/'
    #populating now playing movies
=begin
    request_query = "now_playing" + "?api_key="+ api_key
    url = "#{request_uri}#{request_query}"

    buffer = open(url).read
    movieData = JSON.parse(buffer)
    movieData = movieData['results']

    for i in (0..movieData.length-1) do
      m = Movie.create(:tmdbID => movieData[i]['id'],
                      :title => movieData[i]['title'],
                      :status => movieData[i]['status'],
                      :synopsis => movieData[i]['overview'],
                      :posterPath => movieData[i]['poster_path'],
                      :releaseDate => movieData[i]['release_date'],
                      :averageScore => movieData[i]['vote_average'],
                      :numVotes => movieData[i]['vote_count'])
    end
=end
  #populating popular movies
    request_query = "popular" + "?api_key="+ api_key
    url = "#{request_uri}#{request_query}"

    buffer = open(url).read
    movieData = JSON.parse(buffer)
    movieData = movieData['results']

    for i in (0..movieData.length-1) do
      m = Movie.create(:tmdbID => movieData[i]['id'],
                      :title => movieData[i]['title'],
                      :status => movieData[i]['status'],
                      :synopsis => movieData[i]['overview'],
                      :posterPath => movieData[i]['poster_path'],
                      :releaseDate => movieData[i]['release_date'],
                      :averageScore => movieData[i]['vote_average'],
                      :numVotes => movieData[i]['vote_count'])
    end
=begin
    #populating top rated on tmdb
    request_query = "top_rated" + "?api_key="+ api_key
    url = "#{request_uri}#{request_query}"

    buffer = open(url).read
    movieData = JSON.parse(buffer)
    movieData = movieData['results']

    for i in (0..movieData.length-1) do
      m = Movie.create(:tmdbID => movieData[i]['id'],
                      :title => movieData[i]['title'],
                      :status => movieData[i]['status'],
                      :synopsis => movieData[i]['overview'],
                      :posterPath => movieData[i]['poster_path'],
                      :releaseDate => movieData[i]['release_date'],
                      :averageScore => movieData[i]['vote_average'],
                      :numVotes => movieData[i]['vote_count'])
    end

    #populating upcoming movies
    request_query = "upcoming" + "?api_key="+ api_key
    url = "#{request_uri}#{request_query}"

    buffer = open(url).read
    movieData = JSON.parse(buffer)
    movieData = movieData['results']

    for i in (0..movieData.length-1) do
      m = Movie.create(:tmdbID => movieData[i]['id'],
                      :title => movieData[i]['title'],
                      :status => movieData[i]['status'],
                      :synopsis => movieData[i]['overview'],
                      :posterPath => movieData[i]['poster_path'],
                      :releaseDate => movieData[i]['release_date'],
                      :averageScore => movieData[i]['vote_average'],
                      :numVotes => movieData[i]['vote_count'])
    end
=end
  end
end
