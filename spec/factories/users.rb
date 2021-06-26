 FactoryBot.define do
  factory :user do
      name                   {"test"}
      email                  {"test@test"}
      password               {'test1234'}
      password_confirmation  {password}
    end
  end

