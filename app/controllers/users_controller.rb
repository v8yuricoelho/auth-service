# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    render json: { email: user.email }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end
end
