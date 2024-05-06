# frozen_string_literal: true

module Api
  # api controller
  class ApiController < ApplicationController
    before_action :authenticate_request
    helper_method :current_user
    attr_reader :current_user

    private

    def authenticate_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      begin
        @decoded = decode_token(header)
        @current_user = User.find(@decoded[:user_id])
      rescue JWT::DecodeError => e
        Rails.logger.error("Error decoding or authorizing request: #{e.message}")
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end

    def decode_token(token)
      body = JWT.decode(token, ENV['SECRET_KEY'], true, { algorithm: 'HS256' })[0]
      HashWithIndifferentAccess.new body
    end
  end
end
