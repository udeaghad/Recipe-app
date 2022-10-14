require 'rails_helper'

RSpec.describe 'foods', type: :request do
  before :each do
    sign_in create(:user)
    get root_path
  end

  it 'works! (checked http status)' do
    expect(response).to have_http_status(200)
  end

  it 'page contains the correct text' do
    expect(response.body).to include('Unit Price')
  end

  it 'renders index template ' do
    expect(response).to render_template('index')
  end
end
