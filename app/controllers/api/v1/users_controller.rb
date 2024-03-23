module Api
  module V1
    class UsersController < Api::ApiController
      def index
        @users = User.all
      end
    end
  end
end
