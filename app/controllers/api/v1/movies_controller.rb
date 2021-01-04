module Api
  module V1
    class MoviesController < Api::V1::ApiController
      before_action :set_movie, only: :show

      def index
        page = params[:page] || 1
        @movies = Movie.paginate(page: page,per_page: params[:per_page])
      end

      def show; end

      private

      def set_movie
        @movie = Movie.find(params[:id])
      end
    end
  end
end