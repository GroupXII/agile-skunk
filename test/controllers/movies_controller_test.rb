require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post :create, movie: { averageScore: @movie.averageScore, genres: @movie.genres, imdbID: @movie.imdbID, numVotes: @movie.numVotes, posterPath: @movie.posterPath, releaseDate: @movie.releaseDate, status: @movie.status, synopsis: @movie.synopsis, title: @movie.title, tmdbID: @movie.tmdbID }
    end

    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should show movie" do
    get :show, id: @movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie
    assert_response :success
  end

  test "should update movie" do
    patch :update, id: @movie, movie: { averageScore: @movie.averageScore, genres: @movie.genres, imdbID: @movie.imdbID, numVotes: @movie.numVotes, posterPath: @movie.posterPath, releaseDate: @movie.releaseDate, status: @movie.status, synopsis: @movie.synopsis, title: @movie.title, tmdbID: @movie.tmdbID }
    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete :destroy, id: @movie
    end

    assert_redirected_to movies_path
  end
  
  
  
  test "should favorite" do
    @user = user(:test)
    @movie = movie(:testmovie)
    @user.favorites << @movie
    
    assert_equal(1, @user.favorites.count, message=nil ) 
    
  end
end
