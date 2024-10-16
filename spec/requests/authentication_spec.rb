# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:user) { create(:user) }

  describe 'POST /auth/register' do
    context 'with valid parameters' do
      let(:valid_params) { attributes_for(:user) }

      it 'creates a new user and returns a JWT token' do
        post '/auth/register', params: valid_params
        expect(response).to have_http_status(:created)
        expect(json_response['token']).to be_present
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          email: '',
          password: 'short'
        }
      end

      it 'returns an error' do
        post '/auth/register', params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_response['error']).to include("Email can't be blank",
                                                  'Password is too short (minimum is 6 characters)')
      end
    end
  end

  describe 'POST /auth/login' do
    context 'with valid credentials' do
      it 'returns a JWT token' do
        post '/auth/login', params: { email: user.email, password: 'password' }
        expect(response).to have_http_status(:ok)
        expect(json_response['token']).to be_present
      end
    end

    context 'with invalid credentials' do
      it 'returns an unauthorized error' do
        post '/auth/login', params: { email: user.email, password: 'wrong_password' }
        expect(response).to have_http_status(:unauthorized)
        expect(json_response['error']).to eq('Invalid email or password')
      end
    end
  end
end
