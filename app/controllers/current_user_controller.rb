# frozen_string_literal: true

# Current user class
class CurrentUserController < Api::ApiController
  def show
    @user = current_user
  end
end
