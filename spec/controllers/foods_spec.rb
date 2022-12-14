# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FoodsController, type: :controller do # rubocop:disable Metrics/BlockLength
  login_user
  let(:valid_attributes) do
    {
      name: 'Food',
      measurement_unit: 'unit',
      price: 1.5,
      user_id: subject.current_user.id,
      id: 1,
      created_at: Time.now,
      updated_at: Time.now
    }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Food' do
        expect do
          post :create, params: { food: valid_attributes }
        end.to change(Food, :count).by(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested food' do
      food = Food.create! valid_attributes
      expect do
        delete :destroy, params: { id: food.to_param }
      end.to change(Food, :count).by(-1)
    end
  end
end
