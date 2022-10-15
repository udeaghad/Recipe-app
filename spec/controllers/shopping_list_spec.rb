require 'rails_helper'

RSpec.describe ShoppingListController, type: :controller do
  login_user
  let(:valid_attributes) do
    {
      name: 'Shopping List',
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
end