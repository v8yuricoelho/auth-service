# frozen_string_literal: true

require 'jwt'
class ApplicationController < ActionController::API
  SECRET_KEY = ENV['JWT_SECRET'] || 'your_secret_key'

  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def decode_token(token)
    JWT.decode(token, SECRET_KEY)[0]
  rescue JWT::DecodeError
    nil
  end
end
