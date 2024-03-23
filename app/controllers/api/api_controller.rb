module Api
  class ApiController < ApplicationController
    before_action :authenticate_request

    private

    def authenticate_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      begin
        @decoded = decode_token(header)
        @current_user = User.find(@decoded[:user_id])
      rescue
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end

    def decode_token(token)
      body = JWT.decode(token, 'your_secret', true, { algorithm: 'HS256' })[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end
