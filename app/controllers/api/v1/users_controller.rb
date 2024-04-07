module Api
  module V1
    class UsersController < Api::ApiController
      before_action :authenticate_request

      def index
        @users = User.all
      end
    end
  end
end
