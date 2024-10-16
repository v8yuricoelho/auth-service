# frozen_string_literal: true

class AuthenticationController < ApplicationController
  def register
    user = User.new(email: params[:email], password: params[:password])

    if user.save
      exp = Time.now.to_i + 24 * 3600
      token = encode_token(user_id: user.id, exp: exp)
      render json: { token: token }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = encode_token(user_id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
