# API V1
module Api
  module V1
    # favorite class for viewer
    class FavoritesController < Api::V1::ApiController
      before_action :set_viewer, only: [:assign_favorite, :remove_favorite]
      before_action :find_movie, only: [:assign_favorite, :remove_favorite]

      def index
        page = params[:page] || 1
        @movies = Movie.paginate(page: page, per_page: params[:per_page])
      end

      def show; end

      def assign_favorite
        @movies = @viewer.add_favorite(@movie)
        @message = "Movie #{@movie.name} added to your favoritees !"
        
        render 'favorited_movies'
      end

      def remove_favorite
        # if it is already favorited, remove it. else it cannot be unfavorited
        return favorite_not_found(@movie) unless @viewer.movies.include?(@movie)

        @movies = @viewer.remove_favorite(@movie)
        @message = "Movie #{@movie.name} have removed from your favorites"
        @movies = @viewer.movies

        render 'favorited_movies'
      end

      def fav_movies
        @viewer = Viewer.find_by_username!(params[:username])
        @movies = @viewer.movies
        @message = 'Data Found !'
        render 'favorited_movies'
      end

      private
      
      def viewer_not_found
        render json: { success: false, message: 'User Not Found !' }, status: :not_found
      end

      def favorite_not_found(movie)
        render json: { success: false, message: "Movie #{movie.name} are Not Favorited yet for this User!" }, status: :not_found
      end
      
      def find_movie
        @movie = Movie.find(params[:movie_id])
      end

      def set_viewer
        @viewer = Viewer.find_by_username(params[:username])
        return viewer_not_found if @viewer.blank?
      end
    end
  end
end