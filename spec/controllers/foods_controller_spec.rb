require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  login_user

  let(:valid_attributes) do
    { name: 'Apple', measurement_unit: 'kg', price: '20' }
  end

  let(:valid_session) { {} }

  describe 'GET /index' do
    it 'works! (checked http status)' do
      Food.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to have_http_status(200)
    end

    it 'renders index template ' do
      Food.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to render_template('index')
    end
  end
end
