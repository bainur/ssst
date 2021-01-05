# API v1
module Api
  module V1
    # login class
    class LoginController < Api::V1::ApiController

      def login_viewer
        @viewer = Viewer.where(username: params[:username]).first

        if @viewer.present?
          @message = 'User Found , Welcome Back !'
        else
          @viewer = Viewer.new(username: params[:username])
          if @viewer.save
            @message = 'User Created'
          else
            return render json: {success:false, message: @viewer.errors.full_messages.join(', ')}, status: :unprocessable_entity
          end
        end
        @movies = @viewer.movies
        render 'api/v1/favorites/favorited_movies'
      end
    end
  end
end