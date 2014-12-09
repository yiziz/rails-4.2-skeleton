module Api
  module V1
    class SessionsController < ApiController
      # authenticate
      def create
        auth = Authentication.new params
        if auth.missing_params?
          error! 'no_credentials'
        else
          if auth.authenticated?
            access_token = AccessToken.create user: auth.user, expires_at: Time.now + AppConfig.access_token_expires_in
            data_set! :access_token, access_token.token
            data_set! :expires_at, access_token.expires_at
            data_set! :user_role, auth.user.role_id
            data_set! :user, UserSerializer.new(auth.user, scope: auth.user)
          else
            error! 'invalid_credentials'
          end
        end
        render_j
      end
    end
  end
end
