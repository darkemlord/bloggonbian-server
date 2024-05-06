# frozen_string_literal: true

module Api
  module V1
    # Posts controller
    class PostsController < Api::ApiController
      before_action :authenticate_request, only: %i[create destroy update]

      def index
        @posts = Post.all
      end

      def show
        @post = Post.find_by_hashid(params[:id])
      end

      def create
        @post = Post.new(post_params)
        @user = User.find_by_hashid(params[:user_id])
        @genre = Genre.find_by_hashid(params[:genre_id])
        @post.user = @user
        @post.genre = @genre
        if @post.save
          render :create, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      private

      def post_params
        params.require(:post).permit(:title, :body)
      end
    end
  end
end
