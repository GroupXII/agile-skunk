class MoviesController < ApplicationController
  require 'open-uri'
  require 'json'
  require 'pp'
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  api_key = '1bd66d1dc550b5a4cc3a9f2e2210eae9' # this is probably not a good idea.
  request_uri = 'https://api.themoviedb.org/3/movie/'
  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  
  def favorite 
    
    type=params[:type]
    if type == "favorite"
      #movie = Movie.find(params[:id])
      current_user.favorites << @movie
      response :success
      redirect_to :back, notice: '#{@movie.name} Added to Favorites'
      flash[:notice] = "Post successfully created"

    elsif type == "delete"
      current_user.favorites.delete(@movie)
      redirect_to :back, notice: '#{@movie.name} Deleted from Favorites'
    end
  end

  def create
    @movie = Movie.new # from form will only fill ID right now
    
    respond_to do |format|
    if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :imdbID, :tmdbID, :synopsis, :genres, :posterPath, :releaseDate, :status, :averageScore, :numVotes)
    end

end
