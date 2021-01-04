module Api
  module V1
    class LoginController < Api::V1::ApiController

      def login_viewer
        @viewer = Viewer.where(username: params[:username]).first
        if @viewer.present?
          @message = "User Found !"
        else
          @viewer = Viewer.create(username: params[:username])
          @message = "User Created"
        end

        @movies = @viewer.movies
        render 'api/v1/movies/favorited_movies'
      end
    end
  end
end