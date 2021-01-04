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
          @viewer = Viewer.find(favorite_params)
          @viewer.movies << Movie.find(favorite_params[:favorite][:movie_id])
      end

      private

      def favorite_params
        favorite_params = params.require(:favorite).permit(:viewer_id, :movie_id)
      end

      def set_favorite
        @viewer = Viewer.find(params[:id])
        @movies = @viewer.movies
      end
    end
  end
end