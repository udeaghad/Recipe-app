module DeviseRequestSpecHelpers

  include Warden::Test::Helpers

  def sign_in(resource_or_scope, resource = nil)
    resource ||= resource_or_scope
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    login_as(resource, scope: scope)
  end

  def sign_out(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    logout(scope)
  end

  # def login_user
  #   # Before each test, create and login the user
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:user]
  #     user = FactoryBot.create(:user)
  #     # user.confirm! # Or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
  #     sign_in user
  #   end
  # end

end