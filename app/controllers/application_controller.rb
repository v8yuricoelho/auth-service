# frozen_string_literal: true

require 'jwt'
class ApplicationController < ActionController::API
  SECRET_KEY = ENV['JWT_SECRET'] || 'your_secret_key'

  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY)
  end
end
