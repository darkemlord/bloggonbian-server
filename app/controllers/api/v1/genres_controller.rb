module Api
  module V1
    class GenresController < Api::ApiController
      before_action :authenticate_request, only: [:create, :destroy, :update]

      def index
        @genres = Genre.all()
      end

      def show
        @genre = Genre.find_by_hashid(params[:id])
      end


      def create
        @genre = Genre.new(post_params)
        if @genre.save
          render :create, status: :created
        else
          render json: @genre.errors, status: :unprocessable_entity
        end
      end

      private

      def post_params
        params.require(:genre).permit(:name, :description)
      end
    end
  end
end
