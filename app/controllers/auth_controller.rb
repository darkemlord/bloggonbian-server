# frozen_string_literal: true

# Authentication class
class AuthController < ApplicationController
  # POST /register
  def register
    user = User.create(user_params)
    token = encode_token({ user_id: user.hashid, email: user.email })
    if user.valid?
      render json: user_json(user, token), status: :created
    else
      render json: { error: user.errors }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.record.errors.full_messages.join(', ') }, status: :unprocessable_entity
  end

  # POST /login
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.hashid })
      render json: user_json(user, token), status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  # POST /logout
  def logout
    # JWT logout is usually handled client-side by deleting the stored token.
    render json: { message: 'Logged out' }, status: :ok
  end

  private

  def user_params
    params.require(:auth).permit(:email, :password)
  end

  def encode_token(payload)
    exp = 24.hours.from_now.to_i
    payload[:exp] = exp
    JWT.encode(payload, ENV['SECRET_KEY'], 'HS256')
  end

  def user_json(user, token)
    { user: user.hashid, email: user.email, token: token }
  end
end
