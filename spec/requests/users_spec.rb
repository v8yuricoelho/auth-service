# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }

  describe 'GET /users/:id' do
    context 'when user exists' do
      it 'returns the user details' do
        get user_path(user)
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['email']).to eq(user.email)
      end
    end

    context 'when user does not exist' do
      it 'returns a not found response' do
        get user_path(id: -1)
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['error']).to eq('User not found')
      end
    end
  end
end
