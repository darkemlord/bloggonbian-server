module Api
  module V1
    class PostsController < Api::ApiController
      before_action :authenticate_request, only: [:create, :destroy, :update]

      def index
        @posts = Post.all()
      end

      private

      def post_params
        params.require(:post).permit(:title, :body)
      end
    end
  end
end
