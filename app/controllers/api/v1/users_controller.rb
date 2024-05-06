# frozen_string_literal: true

module Api
  module V1
    # user controller
    class UsersController < Api::ApiController

      def index
        @users = User.all
      end
    end
  end
end
