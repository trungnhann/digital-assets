module Api
  module V1
    class BaseController < ApplicationController
      include Authentication

      rescue_from StandardError, with: :handle_error
      rescue_from JWT::DecodeError, with: :invalid_token
      rescue_from JWT::ExpiredSignature, with: :handle_token_expired

      protected

      def handle_error(exception, status = :unprocessable_entity)
        error_response(exception, 'An unexpected error occurred', status)
      end

      def invalid_token(exception)
        error_response(exception, 'Unauthorized: Invalid or missing token', :unauthorized)
      end

      def handle_token_expired(exception)
        error_response(exception, 'Unauthorized: Token has expired', :unauthorized)
      end

      private

      def error_response(exception, message, status)
        response = {
          message:,
          errors: exception.respond_to?(:record) ? exception.record.errors.full_messages : exception.message
        }
        response[:backtrace] = exception.backtrace&.first(10) if Rails.env.development?

        render json: response, status: status, content_type: 'application/json'
      end
    end
  end
end
