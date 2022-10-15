require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
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
        expect {
          post :create, params: { food: valid_attributes }
        }.to change(Food, :count).by(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested food' do
      food = Food.create! valid_attributes
      expect {
        delete :destroy, params: { id: food.to_param }
      }.to change(Food, :count).by(-1)
    end
  end

end