# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do # rubocop:disable Metrics/BlockLength
  login_user
  let(:valid_attributes) do
    {
      name: 'Inventory',
      user_id: subject.current_user.id,
      id: 1
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
      it 'creates a new Inventory' do
        expect do
          post :create, params: { inventory: valid_attributes }
        end.to change(Inventory, :count).by(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested inventory' do
      inventory = Inventory.create! valid_attributes
      expect do
        delete :destroy, params: { id: inventory.to_param }
      end.to change(Inventory, :count).by(-1)
    end
  end
end
