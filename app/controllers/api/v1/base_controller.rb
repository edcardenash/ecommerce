module Api
  module V1
    class BaseController < ApplicationController
      # This line ensures that an admin is authenticated for every action in controllers that inherit from BaseController.
      before_action :authenticate_admin!

      # If an ActiveRecord::RecordNotFound exception is raised, it will be rescued here, and a JSON response with a custom error message will be rendered.
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      private

      # Method to be used when rescuing from ActiveRecord::RecordNotFound
      def not_found
        render json: { error: 'Record not found' }, status: :not_found
      end
    end
  end
end
