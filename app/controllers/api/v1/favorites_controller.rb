module Api
  module V1
    class FavoritesController < Api::V1::ApiController
      before_action :set_favorite, only: :show

      def index
        page = params[:page] || 1
        @movies = Movie.paginate(page: page,per_page: params[:per_page])
      end

      def show

      end

      def assign_favorite
          @viewer = Viewer.find_by_username(params[:favorite][:username])
          if @viewer.blank?
            render json: {success: false, message: "User Not Found" } , status: :not_found
          else
            @movies = @viewer.movies << Movie.find(params[:favorite][:movie_id])
            @message = "Success"
            render 'api/v1/movies/favorited_movies'
          end
      end

      private

      def favorite_params
        favorite_params = params.require(:favorite).permit(:username, :movie_id)
      end

      def set_favorite
        @viewer = Viewer.find(params[:id])
        @movies = @viewer.movies
      end
    end
  end
end