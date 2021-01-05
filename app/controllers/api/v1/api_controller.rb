module Api
  module V1
    class ApiController < ApplicationController
      layout false
      respond_to :json

      rescue_from ActiveRecord::RecordNotFound,        with: :render_not_found
      rescue_from ActiveRecord::RecordInvalid,         with: :render_record_invalid
      rescue_from ActionController::ParameterMissing,  with: :render_parameter_missing
      rescue_from ActiveRecord::RecordNotUnique,  with: :render_uniq_record
      rescue_from ActiveRecord::ValueTooLong, with: :render_too_long
      skip_before_action :verify_authenticity_token
      before_action :check_username_params, except: :login_viewer # all params should include username params, since the auth are only on this way only

      private

      def check_username_params
        if params[:username].blank?
          return render json: { success: false, message: I18n.t('api.errors.missing_param') }, status: :unprocessable_entity
        else
          @username = Viewer.find_by_username(params[:username])
          if @username.blank?
            return render json: { success: false, message: "Username not found ! You should login first to create user !" }, status: :unauthorized
          end
        end
      end

      def render_too_long
        render json: { success: false, message: "Max 20 Charaters !" }, status: :bad_request
      end

      def render_uniq_record(exception)
        logger.info { exception } # for logging
        render json: { success: false, message: "You have already Favorited that movie " }, status: :bad_request
      end

      def render_not_found(exception)
        logger.info { exception } # for logging
        render json: { success: false, message: I18n.t('api.errors.not_found') }, status: :not_found
      end

      def render_record_invalid(exception)
        logger.info { exception } # for logging
        render json: { errors: exception.record.errors.as_json }, status: :bad_request
      end

      def render_parameter_missing(exception)
        logger.info { exception } # for logging
        render json: { success:false,message: I18n.t('api.errors.missing_param') }, status: :unprocessable_entity
      end

    end
  end
end
