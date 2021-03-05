FactoryBot.define do
  factory :user, class: User do
    name { "Test User" }
    email { "test@test.com" }
    password { "testtest" }
    password_confirmation { "testtest" }
  end

  factory :second_user, class: User do
    name { "Test User2" }
    email { "test2@test.co.jp" }
    password { "test2test" }
    password_confirmation { "test2test" }
  end
end
