module Api
  module V1
    module Admins
      class SessionsController < Devise::SessionsController
        respond_to :json

        private

        # Overrides the Devise's respond_with method.
        # This will be triggered after a successful sign_in attempt.
        # It will respond with a JWT token instead of the default Devise behavior.
        def respond_with(resource, _opts = {})
          render json: { token: resource.generate_jwt }
        end

        # Overrides Devise's respond_to_on_destroy method.
        # This will be triggered after a sign_out.
        # It will respond with a no content HTTP status code (204).
        def respond_to_on_destroy
          head :no_content
        end
      end
    end
  end
end
