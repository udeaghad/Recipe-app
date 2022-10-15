require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  login_user
  let(:valid_attributes) do
    {
      name: 'Recipe',
      user_id: subject.current_user.id,
      id: 1,
      public: true,
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

  describe 'GET #show' do
    it 'returns a success response' do
      recipe = Recipe.create! valid_attributes
      get :show, params: { id: recipe.to_param }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Recipe' do
        expect {
          post :create, params: { recipe: valid_attributes }
        }.to change(Recipe, :count).by(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested recipe' do
      recipe = Recipe.create! valid_attributes
      expect {
        delete :destroy, params: { id: recipe.to_param }
      }.to change(Recipe, :count).by(-1)
    end
  end
end