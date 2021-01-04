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

      private

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
