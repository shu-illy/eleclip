FactoryBot.define do
  factory :user do
    name { "Test User" }
    email { "test@test.com" }
    password { "testtest" }
    password_confirmation { "testtest" }
  end
end
