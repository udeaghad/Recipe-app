FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'test@user.com' }
    password { 'mypassword' }
    name { 'Joy' }
    confirmed_at { '2022-10-13 15:41:55.526835' }
    # Add additional fields as required via your User model
  end
end
